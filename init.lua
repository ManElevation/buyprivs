minetest.register_privilege("insurance", {description = "insurance", give_to_singleplayer = true})
local privs = {"fast", "zoom"}

local function ispriv(priv)
    local found = false
    for i=1, #privs, 1 do
        if privs[i] == priv then
            found = true
        end
    end

    return(found)
end

local function take(inv, itemstack, amount)
    for i=1, 32, 1 do
        if inv:get_stack() then
        end
    end
end

minetest.register_chatcommand("buy", {
    description = "Buy a privilege",
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
        local inv = player:get_inventory()
        local priv = minetest.get_player_privs(name)

        if ispriv(param) then
            if param == "fast" and inv:contains_item("main", "default:diamond 99", false) == true and not privs.fast then
                priv.fast = true
                inv:remove_item("main", "default:diamond 99")
                minetest.set_player_privs(name, priv)
                minetest.chat_send_player(name, "Thank you for your purchase. You now have the fast privilege")
            else
                if param == "fast" then
                    minetest.chat_send_player(name, "Not enough diamonds or you already have the privilege")
                end
            end

            if param == "zoom" and inv:contains_item("main", "default:diamond 99", false) == true and not privs.zoom then
                priv.zoom = true
                inv:remove_item("main", "default:diamond 99")
                minetest.set_player_privs(name, priv)
                minetest.chat_send_player(name, "Thank you for your purchase. You can now use zoom")
            else
                if param == "zoom" then
                    minetest.chat_send_player(name, "Not enough diamondblocks or you already have the privilege")
                end
            end
        else
            minetest.chat_send_player(name, minetest.colorize("red", "[ERROR]") .. " Privilege does not exist or you cannot buy it.")
       end
end })
