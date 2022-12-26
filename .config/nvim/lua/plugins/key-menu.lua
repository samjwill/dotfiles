return {
    "linty-org/key-menu.nvim",
    config = function()
        local km = require("key-menu")
        for _, prefix in ipairs(prefix_list) do
            km.set(unpack(prefix))
        end
    end
}

