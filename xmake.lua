add_rules("mode.debug", "mode.release")
add_rules("plugin.compile_commands.autoupdate", {outputdir = "build"})

add_repositories("ncnn-test https://github.com/Willaaaaaaa/xmake-repo.git patch-260116")

option("ncnn_ver", {default = "undefined", showmenu = true, description = "ncnn version"})
add_options("ncnn_ver")

if has_config("ncnn_ver") then
    add_requires("ncnn[vulkan,simpleocv,shared=" .. (is_kind("shared") and "true" or "false") .. "] " .. get_config("ncnn_ver"))
else
    -- "undefined"
end

add_requireconfs("**.python 3.x", {
    override = true,
    system = true,
    configs = {
        headeronly = is_plat("linux")
    }
})

target("xmake-test")
    add_files("ncnn.cc")
    add_packages("ncnn")
