function exists(file)
   local ok, message, code = os.rename(file, file)
   if not ok then
      if code == 13 then
         -- Permission denied, but it exists
         return true
      end
   end
   return ok
end

local expected_pipe_name <const> = "/tmp/nvim.pipe"

if exists(expected_pipe_name) then
	os.execute("\\nvim --server /tmp/nvim.pipe --remote-send \"<C-\\><C-N>:tabedit<CR>\"")
else
	os.execute("\\nvim --listen /tmp/nvim.pipe")
end
