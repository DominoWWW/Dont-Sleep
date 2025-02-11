#Add don't sleep
execute as @s[tag=ds.triggered] at @s run tag @s add ds.triggerOff
execute as @s[tag=!ds.triggered] at @s run tag @s add ds.triggered
execute if entity @s[tag=!ds.triggerOff] as @a at @s run playsound entity.experience_orb.pickup master @a ~ ~ ~ .2 1 .2
execute if entity @s[tag=!ds.triggerOff] as @s at @s run tellraw @a [{"selector":"@a[tag=ds.triggered]","separator":" & ","color":"light_purple"},{"text":" needs the night!","color":"light_purple"}]

#Remove don't sleep trigger
execute as @s[tag=ds.triggerOff] at @s run tag @s remove ds.triggered
execute if entity @s[tag=ds.triggerOff] as @a at @s run playsound entity.experience_orb.pickup master @a ~ ~ ~ .2 .9 .2
execute if entity @s[tag=ds.triggerOff] as @s at @s run tellraw @a [{"selector":"@s","color":"light_purple"},{"text":" no longer needs the night.","color":"light_purple"}]
execute as @s[tag=ds.triggerOff] run tag @s remove ds.triggered
execute as @s run tag @s remove ds.triggerOff

#reset trigger
scoreboard players set @s Dont_Sleep 0
