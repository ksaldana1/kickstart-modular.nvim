return {
  'ggandor/flit.nvim',
  lazy = false,
  opts = {
    keys = { f = 'f', F = 'F', t = 't', T = 'T' },
    labeled_modes = 'nvo',
    -- clever_repeat = true,
    multiline = true,
    opts = {},
  },
  dependencies = {
    'ggandor/leap.nvim',
  },
}
