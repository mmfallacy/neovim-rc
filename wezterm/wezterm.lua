local wezterm = require("wezterm")

local config = {
    color_scheme = 'OneDark (base16)',
    default_prog = { os.getenv("LOCALAPPDATA") .. "\\Microsoft\\WindowsApps\\pwsh.exe" },
    -- disable_default_key_bindings = true,
    font_size = 11.0,
    use_ime = false,
    font = wezterm.font "Cascadia Code",
    window_decorations = "INTEGRATED_BUTTONS|RESIZE",
    -- hide_tab_bar_if_only_one_tab = true,
    integrated_title_buttons = { 'Close' }
}


config.keys = {
    {
        key = 'w',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.CloseCurrentPane { confirm = true },
    },
}

return config