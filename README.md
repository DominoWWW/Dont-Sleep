# Don't Sleep

**Download: [Modrinth](https://modrinth.com/datapack/dont-sleep/versions)**

**For minecraft 26.1 - 26.3!**

Allows players to remind others not to sleep bu using the command `/trigger Dont_Sleep`! 

## Features
- Displayes who is sleeping in chat.
- Players can toggle if they need the night using the command `/trigger Dont_Sleep`!
- Automatically toggles off in the morning or if the player people sleeps/leaves.
- If a player sleeps while the toggle is active, they will hear an alarm and see bold text telling them that someone needs the night.

## Preview
<img src="https://github.com/DominoWWW/Dont-Sleep/blob/main/readme-images/demonstration.gif?raw=true" width="800" alt="A gif demonstrating the datapack."/>

## Wiki
#### Installing:
Insert the zip file into your datapacks folder.

#### Uninstalling:
Run the command `/function dont_sleep:uninstall` and delete the zip file.

#### Commands:
| Command | Descriptions |
| --- | --- |
| ```/trigger Dont_Sleep``` | Toggle Dont Sleep  |
| ```/function dont_sleep:uninstall``` | Uninstalls datapack |

#### Contributing
Clone the repository and install the development tools in a Python virtual environment:

```sh
git clone https://github.com/DominoWWW/Dont-Sleep.git
cd Dont-Sleep
python -m venv .venv
source .venv/bin/activate
python -m pip install beet bolt
```

##### build
Build the datapack with:

```sh
beet build
```

##### Testing
**Individual Tests:** \
You need [carpet mod](https://modrinth.com/mod/carpet) installed to run the tests. 

```commands
/test run dont_sleep:trigger
/test run dont_sleep:time_cancels_trigger
/test run dont_sleep:sleep_cancels_trigger
/test run dont_sleep:leave_cancels_trigger
```

**Run test server:** \
You need [carpet mod](https://modrinth.com/mod/carpet) and [GameTest Fabric](https://modrinth.com/mod/gametest-fabric) installed on a fabric server
Test server start command:
```sh
java -DbundlerMainClass="net.minecraft.gametest.Main" -jar server.jar --packs "<path/to/dir/with/the/datapack>"
```

