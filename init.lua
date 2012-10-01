-- Minetest 0.4 mod: localisation
-- See README.txt for licensing and other information.
-- LOCALISATION
if minetest.setting_get("language") == nil then
	minetest.setting_set("language", "EN")
end

function translate(label_list,msg_label,...)
	local function translation(label_list,language,msg_label,...)
		local msg = label_list[language][msg_label]
		local args = {...}
		for key,arg in ipairs(args) do
			msg = string.gsub(msg, "%$"..key.."", arg)
		end
		return msg
	end
	local function err(language,msg_label)
		return "Translate("..language..","..msg_label..") = No translations available"
	end
	local language = minetest.setting_get("language") -- has previously been defined as EN if not set
	local fallback = "EN"
	if label_list[language] == nil then
		-- Fallback on english
		language = fallback
		if label_list[language] == nil then
			return 
		end err(language,msg_label)
	else
		if label_list[language][msg_label] == nil then
			if language == fallback then
				return err(language,msg_label)
			else
				return translation(label_list,fallback,msg_label,...)
			end
		end
	end
	return translation(label_list,language,msg_label,...)
end