import shutil
import os

def copy_to_config_directory(source_directory):
    current_directory = os.getcwd()
    config_directory = os.path.join(current_directory, ".config")
    
    if not os.path.exists(config_directory):
        os.makedirs(config_directory)
    
    item_name = os.path.basename(source_directory.rstrip('/'))
    
    destination_path = os.path.join(config_directory, item_name)
    
    if os.path.exists(destination_path):
        if os.path.isdir(destination_path):
            shutil.rmtree(destination_path)
        else:
            os.remove(destination_path)
    try:
        if os.path.isdir(source_directory):
            shutil.copytree(source_directory, destination_path)
            print(f"Copied directory {source_directory} to {destination_path}")
        else:
            shutil.copy2(source_directory, destination_path)
            print(f"Copied file {source_directory} to {destination_path}")
    except Exception as e:
        print(f"An error occurred: {e}")

def copy_rc_files(rc_files):
    home_directory = os.path.expanduser("~")
    current_directory = os.getcwd()
    config_directory = os.path.join(current_directory, current_directory)
    if not os.path.exists(config_directory):
        os.makedirs(config_directory)
    for rc_file in rc_files:
        source_file = os.path.join(home_directory, rc_file)
        destination_file = os.path.join(config_directory, rc_file)
        if os.path.exists(destination_file):
            os.remove(destination_file)
        try:
            shutil.copy2(source_file, destination_file)
            print(f"Copied {rc_file} to {destination_file}")
        except FileNotFoundError:
            print(f"{rc_file} not found in the home directory.")
        except Exception as e:
            print(f"An error occurred while copying {rc_file}: {e}")

configs_to_copy = [
        'alacritty',
        'dwm',
        'nvim',
        'ranger',
        'tmux'
        ]
for source_path in configs_to_copy:
    source_path = '/home/w/.config/' + source_path
    copy_to_config_directory(source_path)

rc_files = [
        '.xinitrc',
        '.zshrc'
        ]
copy_rc_files(rc_files)

