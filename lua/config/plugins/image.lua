return {
    "3rd/image.nvim",
    enabled = vim.fn.has("win32") == 0, -- Disable on Windows due to ioctl compatibility issues
    opts = {
        backend = "ueberzug", -- More Windows-friendly backend
        integrations = {
            markdown = {
                enabled = true,
                clear_in_insert_mode = false,
                download_remote_images = true,
                only_render_image_at_cursor = false,
            },
        },
        max_width = nil,
        max_height = nil,
        max_width_window_percentage = nil,
        max_height_window_percentage = 50,
        window_overlap_clear_enabled = false, -- Disable if you have problems with floating windows
        editor_only_render_when_focused = false, -- Render images even when nvim is not focused
        refresh_on_winresize = true, -- Refresh on window resize
        hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" }, -- Enable inline image viewing
    },
}

