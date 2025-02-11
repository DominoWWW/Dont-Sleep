scoreboard players enable @a Dont_Sleep

execute as @a at @s unless score @s Dont_Sleep matches 0 run function dont_sleep:trigger

execute as @a at @s unless entity @s[nbt={SleepTimer:0s}] if entity @a[tag=ds.triggered] run function dont_sleep:waning

execute as @a[tag=ds.triggered,nbt={SleepTimer:1s}] run scoreboard players set @s Dont_Sleep 1

execute as @a unless score @s ds.leaveReset matches 0 run tag @s remove ds.triggered
execute as @a unless score @s ds.leaveReset matches 0 run scoreboard players set @s ds.leaveReset 0

#Update time score
execute store result score $time Dont_Sleep run time query daytime

#Time 0
execute if score $time Dont_Sleep matches 0 run scoreboard players set @a Dont_Sleep 0
execute if score $time Dont_Sleep matches 0 run tag @a remove ds.triggered