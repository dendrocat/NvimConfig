local M = {}

M.patterns = {
	"**/.DS_Store",
	"**/.vs",
	"**/.gitmodules",
	"**/*.booproj",
	"**/*.pidb",
	"**/*.suo",
	"**/*.user",
	"**/*.userprefs",
	"**/*.unityproj",
	"**/*.dll",
	"**/*.exe",
	"**/*.pdf",
	"**/*.mid",
	"**/*.midi",
	"**/*.wav",
	"**/*.gif",
	"**/*.ico",
	"**/*.jpg",
	"**/*.jpeg",
	"**/*.png",
	"**/*.psd",
	"**/*.tga",
	"**/*.tif",
	"**/*.tiff",
	"**/*.3ds",
	"**/*.3DS",
	"**/*.fbx",
	"**/*.FBX",
	"**/*.lxo",
	"**/*.LXO",
	"**/*.ma",
	"**/*.MA",
	"**/*.obj",
	"**/*.OBJ",
	"**/*.asset",
	"**/*.cubemap",
	"**/*.flare",
	"**/*.mat",
	"**/*.meta",
	"**/*.prefab",
	"**/*.unity",
	"^build$",
	"^Build$",
	"^Library$",
	"^library$",
	"^obj$",
	"^Obj$",
	"^Logs$",
	"^logs$",
	"^ProjectSettings$",
	"^UserSettings$",
	"^temp$",
	"^Temp$"
}


function M.is_unity_project()
	local cwd = vim.fn.getcwd()
	local assembly_file = cwd .. "/Assembly-CSharp.csproj"
	return vim.fn.filereadable(assembly_file) == 1
end

return M
