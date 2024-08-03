return {
  "ggandor/flit.nvim",
  lazy = false,
  config = function()
    require('flit').setup {
      keys = { f = 'f', F = 'F', t = 't', T = 'T' },
      labeled_modes = "nvo",
      -- clever_repeat = true,
      multiline = true,
      opts = {}
    }
  end,
  dependencies = {
    "ggandor/leap.nvim",
  },
}
