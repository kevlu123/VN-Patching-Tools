<?php
namespace Helper;

class TextExtractor
{
    private array $texts = [];
    private string  $lastName = '';
    private bool $enabled = false;

    public function __construct(
        private ?string $file
    ) {
        $this->init();
    }

    public function setCharName(string $name): void
    {
        $this->lastName = $name;
    }

    public function setMessage(string $message): void
    {
        if (!$this->enabled) {
            return;
        }
        $this->texts[] = $this->strip($message);
    }

    private function strip($message)
    {
        $replace = ['%K%P', '%LF'];
        if ($this->lastName !== '') {
            $message = $this->lastName . ': ' . $message;
        }
        $message = str_replace($replace, '', $message);
        $message = str_replace('\n', ' ', $message);
        $message .= "\n";
        return $message;
    }

    private function init()
    {
        // Check file set and accessible
        if (!$this->file) {
            return;
        }
        $this->enabled = true;
    }

    public function dump()
    {
        if ($this->file) {
            file_put_contents($this->file, implode("\n", $this->texts));
        }
    }
}