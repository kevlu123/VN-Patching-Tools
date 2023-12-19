<?php
namespace Helper;

class OptionParam
{
    public function __construct(
        private string $code,
        private ?string $default,
        private array $aliases = []
    ) {
    }

    public function getCode(): string
    {
        return $this->code;
    }

    public function getAlias(): array
    {
        return [$this->code, ...$this->aliases];
    }

    public function getDefault(): ?string
    {
        return $this->default;
    }
}