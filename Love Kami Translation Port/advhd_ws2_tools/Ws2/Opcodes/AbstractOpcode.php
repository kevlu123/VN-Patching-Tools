<?php
namespace Ws2\Opcodes;

use Exception;
use Helper\TextExtractor;
use Ws2\FilesValidator;
use Ws2\Reader;

abstract class AbstractOpcode
{
    public const OPCODE = '00';
    public const FUNC = 'Undefined';

    protected ?int $validateKey = null;
    protected array $pointers = [];
    protected ?string $content;
    protected int $compiledSize = 0;

    public function __construct(
        protected Reader $reader,
        protected string $version,
        protected bool $isUpdateMode = false,
        protected ?TextExtractor $textExtractor = null
    ) {
    }

    public function getCompiledSize(): int
    {
        // If size wasn't specifically set
        if ($this->compiledSize === 0 && $this->content !== null) {
            $this->compiledSize = strlen($this->content);
        }
        return $this->compiledSize;
    }

    public function getOpcode(): string
    {
        return static::FUNC;
    }

    public function getPointers(): array
    {
        return $this->pointers;
    }

    public function setPointerLabel(int $pointerId, string $label): void
    {
        $this->content = str_replace('@pointer_'. $pointerId, $label, $this->content);
    }

    public function getContent(): string
    {
        return $this->content;
    }

    public function compile(array $pointers): string
    {
        return $this->content;
    }

    /**
     * @throws Exception
     */
    abstract public function decompile(array &$dataSource): self;

    abstract public function preCompile(?string $params = null): self;

    /**
     * Validates if resource file exists in the packages.
     * Should return a file name in case it does not exists.
     */
    public function validate(?string $params, array &$dataSource, FilesValidator $filesValidator): ?string
    {
        if ($this->validateKey !== null) {
            $params = $this->reader->unpackParams($params);
            if (!$filesValidator->isExist($params[$this->validateKey])) {
                return $params[$this->validateKey];
            }
        }
        return null;
    }
}