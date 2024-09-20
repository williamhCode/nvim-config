local dashboard = require('alpha.themes.dashboard')

local wily = [[
██╗    ██╗██╗██╗  ██╗   ██╗
██║    ██║██║██║  ╚██╗ ██╔╝
██║ █╗ ██║██║██║   ╚████╔╝ 
██║███╗██║██║██║    ╚██╔╝  
╚███╔███╔╝██║███████╗██║   
 ╚══╝╚══╝ ╚═╝╚══════╝╚═╝   
]]
local yoshi = [[
⠀⠀⠀⠀⠀⠀⠀⣀⣀⡰⣋⠉⠲⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⡼⠶⢬⡏⠉⠙⢦⡘⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣇⠀⣤⡇⠀⠀⣶⣷⠈⢲⠒⠲⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢀⡠⠴⠒⠚⠒⠚⠻⢄⡀⢙⠿⠂⠀⠑⠂⢇⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⡴⠋⠀⡠⠄⠀⠀⠀⠀⠀⠈⠃⠀⠀⠀⠀⠀⠀⢯⠑⡆⠀⠀⢠⠒⡦⠀⡀⠀
⡼⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡜⢿⠙⢦⡼⠠⡷⠋⡹⠀
⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⢸⢆⠀⢷⠈⠑⠀⠈⠿⠒⢲
⢱⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢢⣀⠀⠀⠀⠀⣏⡨⢂⡸⠀⠀⠀⢀⡴⠛⠉
⠈⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠁⠀⡏⠀⢀⢮⢀⠔⠉⢀⡴⠛⠛⠉⠀⠀⠀
⠀⠀⠑⢤⣀⠀⠀⠀⢀⣀⠴⢏⢻⠀⡰⠁⢀⠀⠸⠁⠀⢠⠋⠀⢀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢨⠭⠭⢭⣁⣀⣀⣈⠦⢄⡤⠐⠁⠀⠀⠀⢰⣇⣻⡞⠉⢧⠀⠀⠀⠀
⠀⠀⣰⠒⠚⠒⠤⣀⠀⠀⠀⠀⢀⡾⠀⠀⠀⠀⠀⠀⠈⠓⠵⠃⠀⢸⡀⠀⠀⠀
⠀⠀⢘⡶⠒⠒⢈⠆⠀⠀⢀⠞⠉⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠇⠀⠀⠀
⠀⠀⠈⠳⠒⡎⠁⡠⠊⠉⠁⠀⠀⣧⠀⠀⠀⠀⠀⠀⢠⠃⠀⠀⠀⡼⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠉⠉⣠⠖⠲⠦⡀⢀⡼⣆⠀⠀⠀⠀⠀⡆⠀⠀⠀⠐⣅⡀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢸⡗⢲⡦⣄⠙⢞⡒⢬⡳⣤⣀⣀⣀⣰⡄⠀⠀⠀⠇⠏⠻⢢⠀
⠀⠀⠀⠀⠀⠀⠘⣆⠀⠈⠑⢵⡄⠀⢀⡻⠁⠀⠉⠀⠀⠈⠳⠶⡦⢐⠀⠀⠱⢂
⠀⠀⠀⠀⠀⠀⠀⠈⠓⠦⢤⡬⠻⡶⣌⡇⠀⠀⠀⠀⠀⠀⠀⠀⢸⠁⠀⠀⠀⡏
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⠤⠼⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢄⣀⣀⣔⡕
]]
dashboard.section.header.val = vim.split(wily, "\n")


-- braille testing
local _ = [[
  U+280x	⠀	⠁	⠂	⠃	⠄	⠅	⠆	⠇	⠈	⠉	⠊	⠋	⠌	⠍	⠎	⠏
  U+281x	⠐	⠑	⠒	⠓	⠔	⠕	⠖	⠗	⠘	⠙	⠚	⠛	⠜	⠝	⠞	⠟
  U+282x	⠠	⠡	⠢	⠣	⠤	⠥	⠦	⠧	⠨	⠩	⠪	⠫	⠬	⠭	⠮	⠯
  U+283x	⠰	⠱	⠲	⠳	⠴	⠵	⠶	⠷	⠸	⠹	⠺	⠻	⠼	⠽	⠾	⠿

  U+284x	⡀	⡁	⡂	⡃	⡄	⡅	⡆	⡇	⡈	⡉	⡊	⡋	⡌	⡍	⡎	⡏
  U+285x	⡐	⡑	⡒	⡓	⡔	⡕	⡖	⡗	⡘	⡙	⡚	⡛	⡜	⡝	⡞	⡟
  U+286x	⡠	⡡	⡢	⡣	⡤	⡥	⡦	⡧	⡨	⡩	⡪	⡫	⡬	⡭	⡮	⡯
  U+287x	⡰	⡱	⡲	⡳	⡴	⡵	⡶	⡷	⡸	⡹	⡺	⡻	⡼	⡽	⡾	⡿
  U+288x	⢀	⢁	⢂	⢃	⢄	⢅	⢆	⢇	⢈	⢉	⢊	⢋	⢌	⢍	⢎	⢏
  U+289x	⢐	⢑	⢒	⢓	⢔	⢕	⢖	⢗	⢘	⢙	⢚	⢛	⢜	⢝	⢞	⢟
  U+28Ax	⢠	⢡	⢢	⢣	⢤	⢥	⢦	⢧	⢨	⢩	⢪	⢫	⢬	⢭	⢮	⢯
  U+28Bx	⢰	⢱	⢲	⢳	⢴	⢵	⢶	⢷	⢸	⢹	⢺	⢻	⢼	⢽	⢾	⢿
  U+28Cx	⣀	⣁	⣂	⣃	⣄	⣅	⣆	⣇	⣈	⣉	⣊	⣋	⣌	⣍	⣎	⣏
  U+28Dx	⣐	⣑	⣒	⣓	⣔	⣕	⣖	⣗	⣘	⣙	⣚	⣛	⣜	⣝	⣞	⣟
  U+28Ex	⣠	⣡	⣢	⣣	⣤	⣥	⣦	⣧	⣨	⣩	⣪	⣫	⣬	⣭	⣮	⣯
  U+28Fx	⣰	⣱	⣲	⣳	⣴	⣵	⣶	⣷	⣸	⣹	⣺	⣻	⣼	⣽	⣾	⣿
]]

-- nerd testing
local box_drawing = [[
          0 1 2 3 4 5 6 7 8 9 A B C D E F
  U+250x  ─ ━ │ ┃ ┄ ┅ ┆ ┇ ┈ ┉ ┊ ┋ ┌ ┍ ┎ ┏
  U+251x  ┐ ┑ ┒ ┓ └ ┕ ┖ ┗ ┘ ┙ ┚ ┛ ├ ┝ ┞ ┟
  U+252x  ┠ ┡ ┢ ┣ ┤ ┥ ┦ ┧ ┨ ┩ ┪ ┫ ┬ ┭ ┮ ┯
  U+253x  ┰ ┱ ┲ ┳ ┴ ┵ ┶ ┷ ┸ ┹ ┺ ┻ ┼ ┽ ┾ ┿
  U+254x  ╀ ╁ ╂ ╃ ╄ ╅ ╆ ╇ ╈ ╉ ╊ ╋ ╌ ╍ ╎ ╏
  U+255x  ═ ║ ╒ ╓ ╔ ╕ ╖ ╗ ╘ ╙ ╚ ╛ ╜ ╝ ╞ ╟
  U+256x  ╠ ╡ ╢ ╣ ╤ ╥ ╦ ╧ ╨ ╩ ╪ ╫ ╬ ╭ ╮ ╯
  U+257x  ╰ ╱ ╲ ╳ ╴ ╵ ╶ ╷ ╸ ╹ ╺ ╻ ╼ ╽ ╾ ╿
]]

local box_elements = [[
          0 1 2 3 4 5 6 7 8 9 A B C D E F
  U+258x  ▀ ▁ ▂ ▃ ▄ ▅ ▆ ▇ █ ▉ ▊ ▋ ▌ ▍ ▎ ▏
  U+259x  ▐ ░ ▒ ▓ ▔ ▕ ▖ ▗ ▘ ▙ ▚ ▛ ▜ ▝ ▞ ▟
]]

dashboard.section.header.opts.hl = "DashboardHeader"
dashboard.section.buttons.val = {
  dashboard.button("SPC s f", "󰍉  Find file"),
  dashboard.button("SPC s o", "󰈢  Recently opened files"),
  dashboard.button("SPC s g", "󰈬  Find word"),
}
dashboard.section.buttons.opts.hl = "DashboardCenter"

local padding_val = math.floor((vim.o.lines - 16) * 0.30)
dashboard.config.layout = {
  { type = "padding", val = padding_val },
  unpack(dashboard.config.layout)
}

-- fix for neo-tree
dashboard.config.opts.noautocmd = true

require('alpha').setup(dashboard.config)

