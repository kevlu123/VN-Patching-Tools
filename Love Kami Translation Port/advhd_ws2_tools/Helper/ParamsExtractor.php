<?php
namespace Helper;

class ParamsExtractor
{
    /**
     * @param string[] $argv
     * @param OptionParam[] $options
     */
    public function extractParams(array $argv, array $options): array
    {
        $result = [];
        $params = $this->unpackParams($argv);
        foreach ($options as $option) {
            foreach ($option->getAlias() as $alias) {
                if (isset($params[$alias])) {
                    $result[$option->getCode()] = $params[$alias];
                    continue(2);
                }
            }
            $result[$option->getCode()] = $option->getDefault();
        }
        return $result;
    }

    private function unpackParams(array $argv): array
    {
        $params = [];
        foreach ($argv as $param) {
            if ($param[0] !== '-') {
                continue;
            }
            $param = explode('=', $param);
            if (!isset($param[1])) {
                continue;
            }
            $name = trim($param[0], '-');
            $params[$name] = $param[1];
        }
        return $params;
    }
}