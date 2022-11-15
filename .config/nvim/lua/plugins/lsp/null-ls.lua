local ready, nulls = pcall(require, "null-ls")
if not ready then
    return
end

nulls.setup()
