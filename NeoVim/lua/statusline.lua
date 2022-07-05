local modes = {
  ['n']  = 'Normal',
  ['no'] = 'N·Pending',
  ['v']  = 'Visual',
  ['V']  = 'V·Line',
  [''] = 'V·Block',
  ['s']  = 'Select',
  ['S']  = 'S·Line',
  [''] = 'S·Block',
  ['i']  = 'Insert',
  ['ic'] = 'Insert',
  ['R']  = 'Replace',
  ['Rv'] = 'V·Replace',
  ['c']  = 'Command',
  ['cv'] = 'Vim·Ex',
  ['ce'] = 'Ex',
  ['r']  = 'Prompt',
  ['rm'] = 'More',
  ['r?'] = 'Confirm',
  ['!']  = 'Shell',
  ['t']  = 'Terminal',
}

function mode_current()
    return modes[vim.api.nvim_get_mode().mode]:upper()
end

function file_encoding()
    local fileencoding = vim.bo.fileencoding
    if fileencoding == '' then
        return 'none'
    end
    return fileencoding
end

function file_type()
    local filetype = vim.bo.filetype
    if filetype == '' then
        return 'none'
    end
    return filetype
end

vim.opt.statusline = " %{luaeval('mode_current()')} %t %m %= -- %{&fileformat}｜%{luaeval('file_encoding()')}｜%{luaeval('file_type()')} -- %3p%% %3l:%3c "
