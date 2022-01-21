local present, close_buffers = pcall(require, "close_buffers")

if not present then
   return
end


close_buffers.setup {

}
