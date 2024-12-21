function FindDuplicates()
  local duplicates = {} -- Store duplicate lines
  local seen = {} -- Track lines we've seen
  local duplicate_count = 0

  -- Iterate over all lines in the current buffer
  local buf = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

  for _, line in ipairs(lines) do
    if line ~= "" then
      if seen[line] then
        if not duplicates[line] then
          duplicates[line] = true
          duplicate_count = duplicate_count + 1
        end
      else
        seen[line] = true
      end
    end
  end

  -- Highlight duplicate lines
  vim.api.nvim_buf_clear_namespace(buf, -1, 0, -1) -- Clear previous highlights
  for i, line in ipairs(lines) do
    if duplicates[line] then
      vim.api.nvim_buf_add_highlight(buf, -1, "Search", i - 1, 0, -1) -- Highlight duplicate lines
    end
  end

  -- Add duplicates to the 'd' register
  local duplicate_text = table.concat(vim.tbl_keys(duplicates), "\n")
  vim.fn.setreg("d", duplicate_text)

  -- Print a message
  print(duplicate_count .. " duplicates found")
end

-- Command to call the function
vim.api.nvim_create_user_command("FindDuplicates", FindDuplicates, {})
