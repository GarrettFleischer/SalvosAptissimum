note
	description: "Main window for this application"
	author: "Generated by the New Vision2 Application Wizard."
	date: "$Date: 2016/5/23 22:27:9 $"
	revision: "1.0.0"

class
	MAIN_WINDOW

inherit

	EV_TITLED_WINDOW
		redefine
			create_interface_objects,
			initialize,
			is_in_default_state
		end

	INTERFACE_NAMES
		export
			{NONE} all
		undefine
			default_create,
			copy
		end

create
	default_create


		-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

feature {NONE} -- Constants

	Window_title: STRING = "Salvos Aptissimum Server"
			-- Title of the window.

	Window_width: INTEGER = 1280
			-- Initial width for this window.

	Window_height: INTEGER = 720
			-- Initial height for this window.


		-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

feature {NONE} -- Widgets

	main_container: EV_HORIZONTAL_BOX
			-- Main container (contains all widgets displayed in this window).

	log_window: EV_RICH_TEXT
			-- Log window

	command_window: EV_TEXT_FIELD
			-- Command text box

	map_window: EV_RICH_TEXT
			-- Map window

	-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

feature {NONE} -- Initialization

	create_interface_objects
			-- <Precursor>
		do
				-- Create main container & components.
			create main_container
			create log_window
			create command_window
			create map_window

				-- Create the menu bar.
			create standard_menu_bar
				-- Create file menu.
			create file_menu.make_with_text (Menu_file_item)
				-- Create help menu.
			create help_menu.make_with_text (Menu_help_item)

				-- Create a status bar and a status label.
			create standard_status_bar
			create standard_status_label.make_with_text ("Add your status text here...")
		end

		-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	initialize
			-- Build the interface for this window.
		do
			Precursor {EV_TITLED_WINDOW}

				-- Create and add the menu bar.
			build_standard_menu_bar
			set_menu_bar (standard_menu_bar)

				-- Create and add the status bar.
			build_standard_status_bar
			lower_bar.extend (standard_status_bar)
			build_main_container
			extend (main_container)

				-- Execute `request_close_window' when the user clicks
				-- on the cross in the title bar.
			close_request_actions.extend (agent request_close_window)

				-- Set the title of the window.
			set_title (Window_title)

				-- Set the initial size of the window.
			set_size (Window_width, Window_height)
		end

		-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	is_in_default_state: BOOLEAN
			-- Is the window in its default state?
			-- (as stated in `initialize')
		do
			Result := (width = Window_width) and then (height = Window_height) and then (title.is_equal (Window_title))
		end

		-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

feature {NONE} -- Menu Implementation

	standard_menu_bar: EV_MENU_BAR
			-- Standard menu bar for this window.

		-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	file_menu: EV_MENU
			-- "File" menu for this window (contains New, Open, Close, Exit...)

		-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	help_menu: EV_MENU
			-- "Help" menu for this window (contains About...)

		-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	build_standard_menu_bar
			-- Create and populate `standard_menu_bar'.
		do
				-- Add the "File" menu.
			build_file_menu
			standard_menu_bar.extend (file_menu)
				-- Add the "Help" menu.
			build_help_menu
			standard_menu_bar.extend (help_menu)
		ensure
			menu_bar_initialized: not standard_menu_bar.is_empty
		end

		-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	build_file_menu
			-- Create and populate `file_menu'.
		local
			menu_item: EV_MENU_ITEM
		do
			create menu_item.make_with_text (Menu_file_new_item)
				--| TODO: Add the action associated with "New" here.
			file_menu.extend (menu_item)
			create menu_item.make_with_text (Menu_file_open_item)
				--| TODO: Add the action associated with "Open" here.
			file_menu.extend (menu_item)
			create menu_item.make_with_text (Menu_file_save_item)
				--| TODO: Add the action associated with "Save" here.
			file_menu.extend (menu_item)
			create menu_item.make_with_text (Menu_file_saveas_item)
				--| TODO: Add the action associated with "Save As..." here.
			file_menu.extend (menu_item)
			create menu_item.make_with_text (Menu_file_close_item)
				--| TODO: Add the action associated with "Close" here.
			file_menu.extend (menu_item)
			file_menu.extend (create {EV_MENU_SEPARATOR})

				-- Create the File/Exit menu item and make it call
				-- `request_close_window' when it is selected.
			create menu_item.make_with_text (Menu_file_exit_item)
			menu_item.select_actions.extend (agent request_close_window)
			file_menu.extend (menu_item)
		ensure
			file_menu_initialized: not file_menu.is_empty
		end

		-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	build_help_menu
			-- Create and populate `help_menu'.
		local
			menu_item: EV_MENU_ITEM
		do
			create menu_item.make_with_text (Menu_help_contents_item)
				--| TODO: Add the action associated with "Contents and Index" here.
			help_menu.extend (menu_item)
			create menu_item.make_with_text (Menu_help_about_item)
			menu_item.select_actions.extend (agent on_about)
			help_menu.extend (menu_item)
		ensure
			help_menu_initialized: not help_menu.is_empty
		end

		-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

feature {NONE} -- StatusBar Implementation

	standard_status_bar: EV_STATUS_BAR
			-- Standard status bar for this window

	standard_status_label: EV_LABEL
			-- Label situated in the standard status bar.
			--
			-- Note: Call `standard_status_label.set_text (...)' to change the text
			--       displayed in the status bar.

	build_standard_status_bar
			-- Populate the standard toolbar.
		do
				-- Initialize the status bar.
			standard_status_bar.set_border_width (2)

				-- Populate the status bar.
			standard_status_label.align_text_left
			standard_status_bar.extend (standard_status_label)
		end

		-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

feature {NONE} -- About Dialog Implementation

	on_about
			-- Display the About dialog.
		local
			about_dialog: ABOUT_DIALOG
		do
			create about_dialog
			about_dialog.show_modal_to_window (Current)
		end

		-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

feature {NONE} -- Implementation, Close event

	request_close_window
			-- Process user request to close the window.
		local
			question_dialog: EV_CONFIRMATION_DIALOG
		do
			create question_dialog.make_with_text (Label_confirm_close_window)
			question_dialog.show_modal_to_window (Current)
			if question_dialog.selected_button ~ (create {EV_DIALOG_CONSTANTS}).ev_ok then
					-- Destroy the window.
				destroy

					-- End the application.
					--| TODO: Remove next instruction if you don't want the application
					--|       to end when the first window is closed..
				if attached (create {EV_ENVIRONMENT}).application as a then
					a.destroy
				end
			end
		end

		-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

feature {NONE} -- Implementation

	build_main_container
			-- Populate `main_container'.
		local
			log_command_container: EV_VERTICAL_BOX
			map_container: EV_VERTICAL_BOX
			hsep_log_command: EV_HORIZONTAL_SEPARATOR
			vsep_log_map: EV_VERTICAL_SEPARATOR
		do
				-- Create locals
			create log_command_container
			create map_container
			create hsep_log_command
			create vsep_log_map

				-- Dissallow editing in log_window & map_window
			log_window.disable_edit
			map_window.disable_edit

				-- Set minimum size on map_window & main_container
			map_window.set_minimum_size (250, 200)
			main_container.set_minimum_size (640, 480)

				-- Add log_window & command_window to log_command_container
			log_command_container.extend (log_window)
			log_command_container.extend (hsep_log_command)
			log_command_container.extend (command_window)
			log_command_container.disable_item_expand (hsep_log_command)
			log_command_container.disable_item_expand (command_window)

				-- Add map_window to map_container
			map_container.extend (map_window)
			map_container.disable_item_expand (map_window)

				-- Add containers to main_container
			main_container.extend (log_command_container)
			main_container.extend (vsep_log_map)
			main_container.extend (map_container)
			main_container.disable_item_expand (vsep_log_map)
			main_container.disable_item_expand (map_container)

		ensure
			main_container_has_log: main_container.has_recursive (log_window)
			main_container_has_command: main_container.has_recursive (command_window)
			main_container_has_map: main_container.has_recursive (map_window)
		end

		-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	log_message (msg: READABLE_STRING_GENERAL)
			-- Append message to prim_log
		do
			if (not log_window.text.is_empty) then
				log_window.append_text ("%N")
			end
			log_window.append_text (msg)
		ensure
			text_appended: log_window.text.substring (log_window.text_length - msg.count + 1, log_window.text_length).has_substring (msg)
		end



end
