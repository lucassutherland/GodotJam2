[1mdiff --git a/scenes/ball_thingy.gd b/scenes/ball_thingy.gd[m
[1mdeleted file mode 100644[m
[1mindex 2967e2d..0000000[m
[1m--- a/scenes/ball_thingy.gd[m
[1m+++ /dev/null[m
[36m@@ -1,34 +0,0 @@[m
[31m-extends RigidBody3D[m
[31m-[m
[31m-@onready var omni_light_3d = $OmniLight3D[m
[31m-@onready var mesh_instance_3d = $MeshInstance3D[m
[31m-[m
[31m-var color;[m
[31m-var colors = [[m
[31m-	Color(0.984, 0.796, 0.894), # pastel pink[m
[31m-	Color(0.702, 0.894, 0.941), # baby blue[m
[31m-	Color(0.800, 0.922, 0.800), # mint green[m
[31m-	Color(1.000, 0.925, 0.753), # soft yellow[m
[31m-	Color(0.929, 0.769, 0.886), # lavender[m
[31m-	Color(0.925, 0.788, 0.694), # peach[m
[31m-][m
[31m-[m
[31m-func _ready():[m
[31m-	rand_color()[m
[31m-[m
[31m-func _process(delta):[m
[31m-	pass[m
[31m-[m
[31m-func rand_color():[m
[31m-	color = colors[randi() % colors.size()][m
[31m-	omni_light_3d.light_color = color;[m
[31m-	[m
[31m-	var mat = StandardMaterial3D.new()[m
[31m-	mat.albedo_color = color[m
[31m-	mat.emission_enabled = true[m
[31m-	mat.emission = color[m
[31m-	mesh_instance_3d.material_override = mat[m
[31m-	[m
[31m-func _on_timer_timeout():[m
[31m-	rand_color()[m
[31m-	[m
[1mdiff --git a/scenes/ball_thingy.gd.uid b/scenes/ball_thingy.gd.uid[m
[1mdeleted file mode 100644[m
[1mindex 42979cf..0000000[m
[1m--- a/scenes/ball_thingy.gd.uid[m
[1m+++ /dev/null[m
[36m@@ -1 +0,0 @@[m
[31m-uid://b4v6x2adkormj[m
[1mdiff --git a/scenes/ball_thingy.tscn b/scenes/ball_thingy.tscn[m
[1mindex 8d639f8..539bc19 100644[m
[1m--- a/scenes/ball_thingy.tscn[m
[1m+++ b/scenes/ball_thingy.tscn[m
[36m@@ -1,6 +1,6 @@[m
 [gd_scene load_steps=5 format=3 uid="uid://bn4rcepxchits"][m
 [m
[31m-[ext_resource type="Script" uid="uid://b4v6x2adkormj" path="res://scenes/ball_thingy.gd" id="1_cwrhf"][m
[32m+[m[32m[ext_resource type="Script" uid="uid://b4v6x2adkormj" path="res://scripts/ball_thingy.gd" id="1_cwrhf"][m
 [m
 [sub_resource type="SphereShape3D" id="SphereShape3D_sugp2"][m
 [m
[1mdiff --git a/scenes/main.tscn b/scenes/main.tscn[m
[1mindex a421ccd..2ddd143 100644[m
[1m--- a/scenes/main.tscn[m
[1m+++ b/scenes/main.tscn[m
[36m@@ -1,10 +1,11 @@[m
[31m-[gd_scene load_steps=9 format=3 uid="uid://du6pb57ikouci"][m
[32m+[m[32m[gd_scene load_steps=10 format=3 uid="uid://du6pb57ikouci"][m
 [m
 [ext_resource type="PackedScene" uid="uid://dgchp7rd1r03k" path="res://scenes/lil_dude.tscn" id="1_o5qli"][m
 [ext_resource type="Texture2D" uid="uid://baei8lt2awtcv" path="res://assets/skybox panoramas/moon_rise_2k.exr" id="1_tbgi4"][m
 [ext_resource type="Script" uid="uid://ddogrcbvlygvk" path="res://scripts/lil_dude.gd" id="2_0wfyh"][m
 [ext_resource type="PackedScene" uid="uid://ig38g3po6q74" path="res://scenes/island.tscn" id="4_jyhfs"][m
 [ext_resource type="PackedScene" uid="uid://bn4rcepxchits" path="res://scenes/ball_thingy.tscn" id="5_tbgi4"][m
[32m+[m[32m[ext_resource type="PackedScene" uid="uid://djjp58grntfgk" path="res://scenes/string_lights.tscn" id="6_tefeu"][m
 [m
 [sub_resource type="PanoramaSkyMaterial" id="PanoramaSkyMaterial_jyhfs"][m
 panorama = ExtResource("1_tbgi4")[m
[36m@@ -24,7 +25,9 @@[m [menvironment = SubResource("Environment_0wfyh")[m
 [m
 [node name="DirectionalLight3D" type="DirectionalLight3D" parent="."][m
 transform = Transform3D(0.846686, 0.0320571, 0.531127, -0.532093, 0.0510104, 0.845148, 0, -0.998183, 0.0602471, 6.6362, 5.6973, 0)[m
[32m+[m[32mlight_color = Color(0.328653, 1, 0.897614, 1)[m
 light_energy = 0.0[m
[32m+[m[32mlight_indirect_energy = 16.0[m
 [m
 [node name="Lil Dude" parent="." instance=ExtResource("1_o5qli")][m
 transform = Transform3D(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 2.00474, 0)[m
[36m@@ -78,3 +81,14 @@[m [mtransform = Transform3D(1, 0, 0, 0, 1, 0, 0, 0, 1, -31.2414, -14.2555, 7.45926)[m
 [m
 [node name="Ball thingy11" parent="Ball thingies" instance=ExtResource("5_tbgi4")][m
 transform = Transform3D(1, 0, 0, 0, 1, 0, 0, 0, 1, -35.0583, -14.2555, 4.09618)[m
[32m+[m
[32m+[m[32m[node name="StringLights" parent="." instance=ExtResource("6_tefeu")][m
[32m+[m[32mtransform = Transform3D(1, 0, 0, 0, 1, 0, 0, 0, 1, -13.9366, 0, -7.84015)[m
[32m+[m
[32m+[m[32m[node name="PointA" parent="StringLights" index="0"][m
[32m+[m[32mtransform = Transform3D(1, 0, 0, 0, 1, 0, 0, 0, 1, 5.57403, -0.449543, 0.436704)[m
[32m+[m
[32m+[m[32m[node name="PointB" parent="StringLights" index="1"][m
[32m+[m[32mtransform = Transform3D(1, 0, 0, 0, 1, 0, 0, 0, 1, -3.1573, -8.1126, -10.4168)[m
[32m+[m
[32m+[m[32m[editable path="StringLights"][m
