# File Formats

All types are little endian and all strings are null terminated in their respective encoding.

<!-- no toc -->
- [ARC](#arc-archive-file)
- [ARC (Legacy)](#arc-archive-file-legacy)
- [PNA](#pna-png-array-file)
- [WS2](#ws2-script-file)
- [Pan.dat](#pandat-audio-panning-data)
- [PTF](#ptf-compressed-ttfotf-font)

## (ARC) Archive File

| Type          | Field         | Description |
|---------------|---------------|-------------|
| int32         | FileCount     | Number of files in the ARC file. |
| int32         | FileHeaderLen | Total length of the all the file headers. |
| fileheader[N] | FileHeaders   | Headers for the files. |
| data[N]       | Files         | Raw data for the files. |

### FileHeader

| Type      | Field      | Description |
|-----------|------------|-------------|
| int32     | DataLen    | Length of the file. |
| int32     | DataOffset | Offset of the file data relative to the end of the subheaders. |
| utf16 str | Filename   | Name of the file. |

## (ARC) Archive File (Legacy)

| Type            | Field        | Description |
|-----------------|--------------|-------------|
| int32           | GroupCount   | Each distinct 3-char file extension of the subfiles forms a group. This is the number of groups. |
| groupheader[N]  | GroupHeaders | Headers for each group. |
| fileheader[N,M] | FileHeaders  | Headers for each file. Headers for the first group appear before the headers for the second group etc. |
| data[N,M] |     | Files        | Raw data for the files. |

### GroupHeader

| Type    | Field         | Description |
|---------|---------------|-------------|
| int8[4] | Extension     | The 3-char null-terminated file extension of the group |
| int32   | FileCount     | The number of files in this group. |
| int32   | ListingOffset | The offset from the beginning of the file of the file listings (containing a list of file headers) of this group. |

### FileHeader

| Type                   | Field         | Description |
|------------------------|---------------|-------------|
| (ASCII?) null padded str | Filename   | The name of the file. Depending on the version, this field is either 9 or 13 bytes. The last byte is always null. |
| int32                  | DataLen    | The length of the file. |
| int32                  | DataOffset | The offset from the beginning of the file of the file data. |

## (PNA) PNG Array File

| Type         | Field        | Description |
|--------------|--------------|-------------|
| int32        | Signature    | 'PNAP' in ASCII. |
| int32        | ?            | Unknown. |
| int32        | ImageWidth   | Width of the whole PNA image. |
| int32        | ImageHeight  | Height of the whole PNA image. |
| int32        | FileCount    | Number of images in the PNA file. |
| imgheader[N] | ImageHeaders | Headers for the images. |
| data         | Images       | Raw data for the images. Some may be 0 bytes. |

### ImgHeader

| Type         | Field        | Description |
|--------------|--------------|-------------|
| int32        | ?            | Unknown.    |
| int32        | FileID       | 0-based index of the image counted from the end. If the image is 0 bytes, this is -1. |
| int32        | OffsetX      | X Offset of this image in the whole PNA image. |
| int32        | OffsetY      | Y Offset of this image in the whole PNA image. |
| int32        | Width        | Width this image. |
| int32        | Height       | Height this image. |
| int32        | ?            | Unknown. |
| float64      | Transparency | Transparency. (Unaligned and 64-bits though?) |
| int32        | DataLen      | Length of the image file. |

## (WS2) Script File

The arguments of each opcode are specific to the script version.

See the [Instruction Documentation](Instructions.md).

| Type    | Field    | Description |
|---------|----------|-------------|
| op[N]   | Ops      | Instructions. |
| int8[8] | Epilogue | 8 bytes with no opcode. |

### Op

| Type   | Field     |
|--------|-----------|
| int8   | Opcode    |
| arg[N] | Arguments |

Each argument can be a
- int8
- int16
- int32
- float32
- sjis str
- array of int16
- array of sjis str
- array of choice

### Array of T

| Type | Field    |
|------|----------|
| int8 | Count    |
| T[N] | Elements |

### Choice

| Type     | Field    | Description |
|----------|----------|-------------|
| int16    | TextId   | Text ID unique to this script used for checking seen text? |
| sjis str | Text     | Text displayed for choice. |
| int8     | ?        | Unknown. |
| int8     | ?        | Unknown. |
| int8     | ?        | Unknown. |
| op       | JumpOp   | The instruction to run if this choice is chosen. The opcode should be 0x06 or 0x07. |

## (Pan.dat) Audio Panning Data?

| Type     | Field      | Description |
|----------|------------|-------------|
| int32    | Signature  | 'PAN2' in ASCII. |
| int32    | EntryCount | Number of entries. |
| entry[N] | Entries    | Entries. |

### Entry

| Type        | Field         |
|-------------|---------------|
| sjis str    | CharacterName |
| int32       | SubEntryCount |
| subentry[N] | SubEntries    |

### SubEntry

| Type        | Field    |
|-------------|----------|
| float32     | ?        |
| int8        | ?        |
| sjis str    | Filename |

## (PTF) Compressed TTF/OTF Font

| Type     | Field           |
|----------|-----------------|
| int32    | DecompressedLen |
| chunk[N] | Chunks          |

### Chunk

| Type          | Field  | Description |
|---------------|--------|-------------|
| bit[8]        | Modes  | The modes of the 8 blocks that follow. |
| (int8/ref)[8] | Blocks | The data or data reference blocks. |

### Ref

| Type   | Field       | Description |
|--------|-------------|-------------|
| bit[4] | Zero        | Unused zero bits. |
| bit[8] | Index       | Index into the history buffer. |
| bit[4] | LenMinusTwo | 2 less than the length of the reference into the history buffer. |

While the output is written, a circular buffer of 4096 bytes keeps
track of the output history.

After all output has been written, the output is XORed with an
externally provided value. This value can be easily inferred
by looking at the first few bytes of the output.

Format bits is an array of 8 bits corresponding to the mode
of 8 'blocks' of data that follow. This bit array is read
starting from the least significant bit.

If the format bit is 1, the next byte is a single byte of data.

If the format bit is 0, the next two bytes encode a reference
to a sequence of data in the history buffer.
Denote the two bytes by 0bAAAABBBB 0bCCCCDDDD.
The index of the sequence in the history buffer is 0bBBBBCCCC.
The length of the sequence is 0b0000DDDD+2 bytes.
This sequence may wrap around the end of the history buffer.
If the index is 0, the end of the data is reached and the
reference is not used.
