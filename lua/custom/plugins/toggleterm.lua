return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = function()
    vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTermToggleAll<cr>')
    local n = 4
    for i = 1, n do
      vim.keymap.set('n', '<leader>tv' .. i, '<cmd>' .. i .. 'ToggleTerm size=80 direction=vertical<cr>')
      vim.keymap.set('n', '<leader>th' .. i, '<cmd>' .. (i + n) .. 'ToggleTerm size=15 direction=horizontal<cr>')
      vim.keymap.set('n', '<leader>tf' .. i, '<cmd>' .. (i + n) .. 'ToggleTerm direction=float<cr>')
    end

    return {
      size = function(term)
        if term.direction == 'horizontal' then
          return 15
        elseif term.direction == 'vertical' then
          return 80
        end
      end,
      on_open = function()
        vim.cmd 'startinsert'
      end,
    }
  end,
}
