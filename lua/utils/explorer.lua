local M = {}

function M.is_explorer_open()
  local explorers = (require("snacks").picker.get({ source = "explorer" }))

  if #explorers > 0 then
    return true
  end

  return false
end

return M
