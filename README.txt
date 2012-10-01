Minetest 0.4 mod: localisation
==============================

License of source code:
-----------------------
Copyright (C) 2011-2012 Jonjeg <jonathan.jegouzo@gmail.com>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

http://www.gnu.org/licenses/lgpl-2.1.html

Description:
------------
This mod allow mod devellopers to publish their mod in differents 
language with less work needed.

Usage:
------

The minetest setting 'language' is set to EN when this mod is first loaded.
You can modify it in your minetest.conf.
If no translation is found for a message, his english counterpart is used instead.
If no english counterpart are found, then an error message is returned.

Exemple(Code lua) :
-------------------
	local translations = {
		EN = {
			message1 = "english version",
			message_with_parameter = "$1 will be replaced by the first additionnal parameter",
			message_existing_in_english_only = "lorem ipsum"
			...etc
		},
		FR = {
			message1 = "version française"
			message_with_parameter = "$1 va être remplacé par la 1ère valeur additionnelle"
			message_with_some_parameters = "$1,$2,$3"
		}
	}
	translate(translations,"message1") -> "english version" -- si language = EN
	translate(translations,"message1") -> "version française" -- si language = FR
	translate(translations,"message1") -> "english version" -- si language = other than FR
	translate(translations,"message_existing_in_english_only") -> "lorem ipsum"
	translate(translations,"message_with_parameter","value") -> "value will be replaced by the first additionnal parameter" -- si language = EN
	translate(translations,"message_with_parameter","value") -> "value va être remplacé par la 1ère valeur additionnelle" -- si language = FR
	translate(translations,"message_with_some_parameters","value",2,3.5) -> "value,2,3.5"
	translate(translations,"message_inexistant","value",2,3.5) -> "Translate(EN,message_inexistant) = No translations available"