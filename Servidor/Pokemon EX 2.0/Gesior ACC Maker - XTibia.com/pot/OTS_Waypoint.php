<?php

/**
 * Code in this file bases on oryginal OTServ OTBM format loading C++ code (iomapotbm.h, iomapotbm.cpp).
 * 
 * @package POT
 * @version 0.1.6
 * @since 0.1.6
 * @author Wrzasq <wrzasq@gmail.com>
 * @copyright 2007 - 2009 (C) by Wrzasq
 * @license http://www.gnu.org/licenses/lgpl-3.0.txt GNU Lesser General Public License, Version 3
 */

/**
 * Map track waypoint.
 * 
 * @package POT
 * @version 0.1.6
 * @since 0.1.6
 * @property-read string $name Waypoint name.
 */
class OTS_Waypoint extends OTS_MapCoords
{
/**
 * Name.
 * 
 * @version 0.1.6
 * @since 0.1.6
 * @var string
 */
    protected $x;

/**
 * Sets waypoint info.
 * 
 * @version 0.1.6
 * @since 0.1.6
 * @param string $name Name.
 * @param int $x X.
 * @param int $y Y.
 * @param int $z Z.
 */
    public function __construct($name, $x, $y, $z)
    {
        $this->name = $name;
        parent::__construct($x, $y, $z);
    }

/**
 * Magic PHP5 method.
 * 
 * <p>
 * Allows object importing from {@link http://www.php.net/manual/en/function.var-export.php var_export()}.
 * </p>
 * 
 * @version 0.1.6
 * @since 0.1.6
 * @param array $properties List of object properties.
 */
    public static function __set_state($properties)
    {
        return new self($properties['name'], $properties['x'], $properties['y'], $properties['z']);
    }

/**
 * Returns name.
 * 
 * @version 0.1.6
 * @since 0.1.6
 * @return stirng Name.
 */
    public function getName()
    {
        return $this->name;
    }

/**
 * Magic PHP5 method.
 * 
 * @version 0.1.6
 * @since 0.1.6
 * @param string $name Property name.
 * @return mixed Property value.
 * @throws OutOfBoundsException For non-supported properties.
 */
    public function __get($name)
    {
        switch($name)
        {
            case 'name':
                return $this->$name;

            default:
                return parent::__get($name);
        }
    }
}

?>
