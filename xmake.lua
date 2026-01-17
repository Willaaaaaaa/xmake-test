add_rules("mode.debug", "mode.release")
add_rules("plugin.compile_commands.autoupdate", {outputdir = "build"})

includes("packages/*.lua")

option("ncnn_ver", {default = "undefined", showmenu = true, description = "ncnn version"})
add_options("ncnn_ver")

if is_config("ncnn_ver", "20260113") then
    add_requires("my-ncnn[vulkan,simpleocv]" .. " 20260113")
elseif is_config("ncnn_ver", "20250916") then
    add_requires("my-ncnn[vulkan,simpleocv]" .. " 20250916")
else
    -- "undefined"
end

add_requireconfs("python", "**.python", {
    override = true,
    system = true,
    configs = {
        headeronly = is_plat("linux")
    }
})

target("xmake-test")
    add_files("ncnn.cc")
    add_packages("my-ncnn")
