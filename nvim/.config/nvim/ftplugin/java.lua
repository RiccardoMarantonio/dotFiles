local home = vim.env.HOME

local jdtls = require("jdtls")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/jdtls-workspace/" .. project_name
local system_os = ""

if vim.fn.has("mac") == 1 then
    system_os = "mac"
elseif vim.fn.has("unix") == 1 then
    system_os = "linux"
elseif vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
    system_os = "win"
else
    system_os = "linux"
end

local bundles = {
    vim.fn.glob(home .. "/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar"),
    vim.fn.expand("~/.local/lib/aspectjtools.jar"),
    vim.fn.expand("~/.local/lib/aspectjrt.jar"),
    vim.fn.expand("~/.local/lib/aspectjweaver.jar"),
    vim.fn.expand("~/.local/lib/bcel.jar"),
    vim.fn.expand("~/.local/lib/javassist.jar"),
}

vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/.local/share/nvim/mason/share/java-test/*.jar", 1), "\n"))

local config = {

    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-javaagent:" .. home .. "/.local/share/nvim/mason/share/jdtls/lombok.jar",
        "-javaagent:" .. home .. "/.local/lib/aspectjweaver.jar", -- AspectJ weaving
        "-Xmx4g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",

        -- Add classpath for the libraries
        -- "-cp",
        -- home
        --     .. "/.local/lib/bcel.jar:"
        --     .. home
        --     .. "/.local/lib/javassist.jar:"
        --     .. home
        --     .. "/.local/lib/aspectjtools.jar:"
        --     .. home
        --     .. "/.local/lib/aspectjrt.jar:"
        --     .. home
        --     .. "/.local/lib/aspectjweaver.jar",

        -- Eclipse jdtls location
        "-jar",
        home .. "/.local/share/nvim/mason/share/jdtls/plugins/org.eclipse.equinox.launcher.jar",
        "-configuration",
        home .. "/.local/share/nvim/mason/packages/jdtls/config_" .. system_os,
        "-data",
        workspace_dir,
    },

    root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "pom.xml", "build.gradle" }),

    settings = {
        java = {

            home = os.getenv("JAVA_HOME"),
            eclipse = {
                downloadSources = true,
            },
            project = {
                referencedLibraries = bundles,
            },
            configuration = {
                updateBuildConfiguration = "interactive",

                runtimes = {
                    {
                        name = "JavaSE-21",
                        path = os.getenv("JAVA_HOME"),
                    },
                },
            },
            maven = {
                downloadSources = true,
            },
            implementationsCodeLens = {
                enabled = true,
            },
            referencesCodeLens = {
                enabled = true,
            },
            references = {
                includeDecompiledSources = true,
            },
            signatureHelp = { enabled = true },
            format = {
                enabled = true,
            },
            completion = {
                favoriteStaticMembers = {
                    -- ... your existing favorites ...
                    -- BCEL
                    "org.apache.bcel.classfile.*",
                    "org.apache.bcel.generic.*",
                    -- JavaAssist
                    "javassist.*",
                    "javassist.bytecode.*",
                    -- AspectJ
                    "org.aspectj.lang.*",
                    "org.aspectj.lang.annotation.*",
                },
                importOrder = {
                    "java",
                    "javax",
                    "org.apache.bcel",
                    "javassist",
                    "org.aspectj",
                    "com",
                    "org",
                },
            },
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
            codeGeneration = {
                toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                },
                useBlocks = true,
            },
        },
    },

    vim.api.nvim_create_autocmd("FileType", {
        pattern = { "java", "aspectj" },
        desc = "Setup jdtls",
        callback = function()
            require("jdtls").start_or_attach({
                capabilities = require("blink.cmp").get_lsp_capabilities(),
                cmd = { "jdtls" },
                root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
            })
        end,
    }),
    flags = {
        allow_incremental_sync = true,
    },
    init_options = {

        bundles = bundles,
        extendedClientCapabilities = jdtls.extendedClientCapabilities,
    },
}

config["on_attach"] = function(client, bufnr)
    jdtls.setup_dap({ hotcodereplace = "auto" })
    require("jdtls.dap").setup_dap_main_class_configs()
end

jdtls.start_or_attach(config)
