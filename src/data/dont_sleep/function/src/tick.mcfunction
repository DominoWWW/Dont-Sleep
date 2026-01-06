from nbtlib import Short

if data storage dont_sleep:data {enabled:1b}:
    scoreboard players enable @a Dont_Sleep
    as @a at @s:
        # Check if the player is sleeping
        unless entity @s[nbt={SleepTimer:0s}]:
            if entity @s[nbt={SleepTimer:1s}]:
                if entity @s[nbt={SleepTimer:1s}, tag=!ds.triggered] run tellraw @a [{"selector":"@s","color":"light_purple"},{"text":" is sleeping","color":"light_purple"}]
                # remove tag if sleeping
                if entity @s[nbt={SleepTimer:1s}, tag=ds.triggered]:
                    tag @s remove ds.triggered
                    tellraw @a [{"selector":"@s","color":"light_purple"},{"text":" is sleeping and no longer needs the night.","color":"light_purple"}]
                
            if entity @a[tag=ds.triggered]:
                execute as @s[nbt={SleepTimer:2s}] run title @s subtitle {"text":"Someone needs the night!","color":"light_purple"}
                execute as @s[nbt={SleepTimer:2s}] run title @s title ""
                for i in range(5, 100, 5):
                    if entity @s[nbt={SleepTimer:Short(Short(i))}] run playsound block.bell.use master @s ~ ~ ~ 1 1 1

        # Check if the player has triggered the Dont_Sleep
        unless score @s Dont_Sleep matches 0:
            # variable to store if "#Add tag" ran or not
            tag @s add ds.run
            # Add tag
            if entity @s[tag=!ds.triggered]:
                tag @s remove ds.run
                tag @s add ds.triggered
                playsound entity.experience_orb.pickup master @a ~ ~ ~ .2 1 .2
                tellraw @a [{"selector":"@a[tag=ds.triggered]","separator":" & ","color":"light_purple"},{"text":" needs the night!","color":"light_purple"}]
            
            # Remove tag
            if entity @s[tag=ds.run]:
                tag @s remove ds.run
                tag @s remove ds.triggered
                playsound entity.experience_orb.pickup master @a ~ ~ ~ .2 .9 .2
                tellraw @a [{"selector":"@s","color":"light_purple"},{"text":" no longer needs the night.","color":"light_purple"}]
            
            # reset Dont_Sleep score
            scoreboard players set @s Dont_Sleep 0
        if score @s ds.leaveReset matches 1..:
            tag @s remove ds.triggered
            scoreboard players set @s ds.leaveReset 0
    store result score $time Dont_Sleep run time query daytime
    if score $time Dont_Sleep matches 0:
        scoreboard players set @a Dont_Sleep 0
        tag @a remove ds.triggered


