import shutil
import os

def copy_from_config_directory_to_home(config_items):
    current_directory = os.getcwd()
    config_directory = os.path.join(current_directory, ".config")
    home_config_directory = os.path.join(os.path.expanduser("~"), ".config")
    if not os.path.exists(home_config_directory):
        os.makedirs(home_config_directory)
    for item in config_items:
        source_path = os.path.join(config_directory, item)
        destination_path = os.path.join(home_config_directory, item)
        if os.path.exists(destination_path):
            if os.path.isdir(destination_path):
                shutil.rmtree(destination_path)
            else:
                os.remove(destination_path)
        try:
            if os.path.isdir(source_path):
                shutil.copytree(source_path, destination_path)
                print(f"Copied directory {source_path} to {destination_path}")
            else:
                shutil.copy2(source_path, destination_path)
                print(f"Copied file {source_path} to {destination_path}")
        except Exception as e:
            print(f"An error occurred while copying {source_path}: {e}")

def copy_rc_files_to_home(rc_files):
    current_directory = os.getcwd()
    config_directory = os.path.join(current_directory, current_directory)
    home_directory = os.path.expanduser("~")
    for rc_file in rc_files:
        source_file = os.path.join(config_directory, rc_file)
        destination_file = os.path.join(home_directory, rc_file)
        if os.path.exists(destination_file):
            os.remove(destination_file)
        try:
            shutil.copy2(source_file, destination_file)
            print(f"Copied {rc_file} to {destination_file}")
        except FileNotFoundError:
            print(f"{rc_file} not found in the current directory's .config.")
        except Exception as e:
            print(f"An error occurred while copying {rc_file}: {e}")

configs_to_copy_back = [
    'alacritty',
    'dwm',
    'nvim',
    'ranger',
    'tmux'
]
copy_from_config_directory_to_home(configs_to_copy_back)

rc_files_back = [
    '.xinitrc',
    '.zshrc'
]
copy_rc_files_to_home(rc_files_back)

