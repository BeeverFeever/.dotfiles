local ok, mason = pcall(require, "mason")
if not ok then
    print("ERROR: mason not setup")
    return
end

mason.setup()
