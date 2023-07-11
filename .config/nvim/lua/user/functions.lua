local vim = vim
local api = vim.api
local input = vim.fn.input
local execute = vim.api.nvim_exec
local fn = vim.fn

function sql()
    vim.fn.inputsave()
    local tableName = input('Table name: ')
    vim.fn.inputrestore()

    if tableName == "" then
        print("Aborted")
        return
    end

    local tableField = ""

    vim.fn.inputsave()
    local createTable = input('Create table? (y/n): ')
    vim.fn.inputrestore()
    if createTable == "y" then
        vim.fn.inputsave()
        tableField = input('Field names (comma separated): ')
        vim.fn.inputrestore()
    end

    execute("set filetype=sql", false)

    execute(":g/^$/d", false)
    execute(":%s/'/''/ge", false)

    execute("silent %s/^/,('/ge", false)
    execute("silent %s/\t/', '/ge", false)
    execute("silent %s/$/')/ge", false)
    execute("noh", false)
    execute("normal! gg", false)

    local insertSql = 'normal 0xOinsert into ' .. tableName .. ' values1001j0'

    execute(insertSql, false)
    local curline = vim.fn.line('.')
    if curline ~= vim.fn.line('$') then
        while curline + 1 ~= vim.fn.line('$') and curline ~= vim.fn.line('$') do
            curline = vim.fn.line('.')
            if curline ~= vim.fn.line('$') then
                execute(insertSql, false)
            end
        end
    end

    -- Replace empty strings with null
    execute([[silent! %s/''/null/g]], false)

    if tableField ~= "" then
        execute("normal! gg", false)
        local sql = "create table " .. tableName .. " ("
        for s_item in tableField:gmatch('([^,]+)') do
            sql = sql .. s_item .. " varchar(500), "
        end
        sql = sql .. ")"
        sql = sql:gsub(", %)", ")")
        execute("normal! O", false)
        vim.api.nvim_set_current_line(sql)
    end

    execute("normal! gg", false)
    execute("normal! \"*yG", false)
end


function FindDuplicates()
    vim.fn.setreg("d", "")
    local lineCounts = {}
    local lineNum = 1
    local dupsCount = 0
    while lineNum <= fn.line('$') do
        local lineText = fn.getline(lineNum)
        if lineText ~= "" then
            lineCounts[lineText] = (lineCounts[lineText] or 0) + 1
        end
        lineNum = lineNum + 1
    end
    execute('syn clear Repeat', false)
    for lineText, count in pairs(lineCounts) do
        if count >= 2 then
            dupsCount = dupsCount + 1
            vim.fn.setreg("d", lineText.."\n")   -- Duplicate     --> register d
            execute('syn match Repeat "^' .. fn.escape(lineText, '".\\^$*[]') .. '$"', false)
        end
    end
    if dupsCount > 0 then
        execute('highlight NormalUnderlined term=underline cterm=underline gui=underline', false)
        print("Found "..dupsCount.." duplicate lines. They're in register ")
        api.nvim_command("echohl NormalUnderlined")
        api.nvim_command("echon \"d\"")
        api.nvim_command("echohl NONE")
    else
        print("No duplicate lines found.")
    end
end



vim.api.nvim_command('command! Sql lua sql()')
vim.api.nvim_command('command! FindDuplicates lua FindDuplicates()')

