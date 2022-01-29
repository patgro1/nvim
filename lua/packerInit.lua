local fn = vim.fn
local packer_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
local missing_packer = fn.empty(fn.glob(packer_path))

if missing_packer > 0 then
    print("Cloning packer")
    vim.fn.delete(packer_path, "rf")
    vim.fn.system(
        {
            "git",
            "clone",
            "https://github.com/wbthomason/packer.nvim",
            "--depth",
            "20",
            packer_path
        }
    )
    vim.cmd("packadd packer.nvim")
    missing_packer = fn.empty(fn.glob(packer_path))

    if missing_packer > 0 then
        error("Could not clone packer !\n Packer path: " .. packer_path)
        return false
    else
        print("Packer cloned successfully")
        vim.api.nvim_command("packadd packer.nvim")
    end
else
    vim.api.nvim_command("packadd packer.nvim")
end
