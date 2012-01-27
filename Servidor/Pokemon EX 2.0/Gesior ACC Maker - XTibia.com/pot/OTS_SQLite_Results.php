<?php

/**#@+
 * @version 0.0.1
 */

/**
 * @version 0.1.5
 * @package POT
 * @author Wrzasq <wrzasq@gmail.com>
 * @copyright 2007 (C) by Wrzasq
 * @license http://www.gnu.org/licenses/lgpl-3.0.txt GNU Lesser General Public License, Version 3
 */

/**
 * This class will drop " quotes from field names in SQLite results.
 * 
 * @version 0.1.5
 * @package POT
 * @ignore
 */
class OTS_SQLite_Results extends PDOStatement
{
/**
 * Stripping single array keys.
 * 
 * @param array $record Record row.
 * @return array Record with dropped quotes from field names.
 */
    private function strip($record)
    {
        // if it's end of results
        if(!( is_array($record) || is_object($record) ))
        {
            return $record;
        }

        // our unescaped row
        $row = array();

        // strips quotes from each field
        foreach($record as $name => $value)
        {
            $row[ preg_replace('/^"?(.*?)"?$/', '\\1', $name) ] = $value;
        }

        return $row;
    }

/**
 * Removes quoting delimiters from single row fields.
 * 
 * @version 0.1.5
 * @param int $mode Not used, for PDO compatibility.
 * @param int $orientation Not used, for PDO compatibility.
 * @param int $offset Not used, for PDO compatibility.
 * @return array Records set.
 */
    public function fetch($mode = null, $orientation = null, $offset = null)
    {
        // standard output
        return $this->strip( parent::fetch() );
    }

/**
 * Removes quotes from all result rows.
 * 
 * @version 0.1.5
 * @param int $mode Not used, for PDO compatibility.
 * @param int $index Not used, for PDO compatibility.
 * @param array $args Not used, for PDO compatibility.
 * @return array Record row.
 */
    public function fetchAll($mode = null, $index = null, $args = array() )
    {
        $results = array();

        // fetches all results
        foreach( parent::fetchAll() as $index => $record)
        {
            $results[$index] = $this->strip($record);
        }

        return $results;
    }
}

/**#@-*/

?>
