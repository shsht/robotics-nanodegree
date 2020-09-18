<?xml version='1.0'?>

<robot name="udacity_bot" xmlns:xacro="http://www.ros.org/wiki/xacro">

<!-- include plugins and renders -->
  <xacro:include filename="$(find udacity_bot)/urdf/udacity_bot.gazebo" />

<!-- chassis -->
  <link name="robot_footprint"></link>
  <joint name="robot_footprint_joint" type="fixed">
    <origin xyz="0 0 0" rpy="0 0 0" />
    <parent link="robot_footprint"/>
    <child link="chassis" />
  </joint>

  <link name='chassis'>
    <pose>0 0 0.1 0 0 0</pose>

    <inertial>
      <mass value="15.0"/>
      <origin xyz="0.0 0 0" rpy=" 0 0 0"/>
      <inertia
          ixx="0.1" ixy="0" ixz="0"
          iyy="0.1" iyz="0"
          izz="0.1"
      />
    </inertial>

    <collision name='collision'>
      <origin xyz="0 0 0" rpy=" 0 0 0"/> 
      <geometry>
        <box size=".4 .2 .1"/>
      </geometry>
    </collision>

    <visual name='chassis_visual'>
      <origin xyz="0 0 0" rpy=" 0 0 0"/>
      <geometry>
        <box size=".4 .2 .1"/>
      </geometry>
    </visual>

    <!-- back caster -->
    <collision name='back_caster_collision'>
      <origin xyz="-0.15 0 -0.05" rpy=" 0 0 0"/>
      <geometry>
        <sphere radius="0.0499"/>
      </geometry>
    </collision>

    <visual name='back_caster_visual'>
      <origin xyz="-0.15 0 -0.05" rpy=" 0 0 0"/>
      <geometry>
        <sphere radius="0.05"/>
      </geometry>
    </visual>

    <!-- front caster -->
    <collision name='front_caster_collision'>
      <origin xyz="0.15 0 -0.05" rpy=" 0 0 0"/>
      <geometry>
        <sphere radius="0.0499"/>
      </geometry>
    </collision>

    <visual name='front_caster_visual'>
      <origin xyz="0.15 0 -0.05" rpy=" 0 0 0"/>
      <geometry>
        <sphere radius="0.05"/>
      </geometry>
    </visual>
  </link>
<!-- /chassis -->


<!-- left wheel link -->
  <link name="left_wheel">
  	<inertial>
  		<mass value="5"/>
  		<origin xyz="0 0 0" rpy="0 1.5707 1.5707"/>
  		<inertia
  			ixx="0.1" ixy="0" ixz="0"
  			iyy="0.1" iyz="0"
  			izz="0.1" 
  		/>
  	</inertial>

  	<collision name="left_wheel_collision">
  		<origin xyz="0 0 0" rpy="0 1.5707 1.5707"/>
  		<geometry>
  			<cylinder length="0.05" radius="0.1" />
  		</geometry>
  	</collision>

  	<visual name="left_wheel_visual">
  		<origin xyz="0 0 0" rpy="0 1.5707 1.5707"/>
  		<geometry>
  			<cylinder length="0.05" radius="0.1"/>
  		</geometry>
  	</visual>
  </link>

  <joint type="continuous" name="left_wheel_hinge">
    <origin xyz="0 0.15 0" rpy="0 0 0"/>
    <child link="left_wheel"/>
    <parent link="chassis"/>
    <axis xyz="0 1 0" rpy="0 0 0"/>
    <limit effort="10000" velocity="1000"/>
    <dynamics damping="1.0" friction="1.0"/>
  </joint>
<!-- /left wheel -->

<!-- right wheel -->
  <link name="right_wheel">
  	<inertial>
  		<mass value="5"/>
  		<origin xyz="0 0 0" rpy="0 1.5707 1.5707"/>
  		<inertia
  			ixx="0.1" ixy="0" ixz="0"
  			iyy="0.1" iyz="0"
  			izz="0.1" 
  		/>
  	</inertial>

  	<collision name="right_wheel_collision">
  		<origin xyz="0 0 0" rpy="0 1.5707 1.5707"/>
  		<geometry>
  			<cylinder length="0.05" radius="0.1" />
  		</geometry>
  	</collision>

  	<visual name="right_wheel_visual">
  		<origin xyz="0 0 0" rpy="0 1.5707 1.5707"/>
  		<geometry>
  			<cylinder length="0.04" radius="0.1"/>
  		</geometry>
  	</visual>
  </link>

  <joint type="continuous" name="right_wheel_hinge">
    <origin xyz="0 -0.15 0" rpy="0 0 0"/>
    <child link="right_wheel"/>
    <parent link="chassis"/>
    <axis xyz="0 -1 0" rpy="0 0 0"/>
    <limit effort="10000" velocity="1000"/>
    <dynamics damping="1.0" friction="1.0"/>
  </joint>
<!-- /right wheel -->

<!-- camera -->
  <link name="camera">
  	<inertia>
  		<mass value="0.1"/>
  		<origin xyz="0 0 0" rpy="0 0 0"/>
  		<inertia
  			ixx="1e-6" ixy="0" ixz="0"
  			iyy="1e-6" iyz="0"
  			izz="1e-6" 
  		/>
  	</inertia>

  	<collision>
  		<origin xyz="0 0 0" rpy="0 0 0"/>
  		<geometry>
  			<box size="0.05 0.05 0.05"/>
  		</geometry>
  	</collision>

  	<visual>
  		<origin xyz="0 0 0" rpy="0 0 0"/>
  		<geometry>
  			<box size="0.05 0.05 0.05"/>
  		</geometry>
  	</visual>
  </link>

  <joint type="fixed" name="camera_joint">
  	<origin xyz="0.2 0 0" rpy="0 0 0"/>
  	<child link="camera" />
  	<parent link="chassis"/>
  </joint>
<!-- /camera -->

<!-- hokuyo laser scanner -->
  <link name="hokuyo">
  	<inertia>
  		<mass value="0.1"/>
  		<origin xyz="0 0 0" rpy="0 0 0"/>
  		<inertia
  			ixx="1e-6" ixy="0" ixz="0"
  			iyy="1e-6" iyz="0"
  			izz="1e-6" 
  		/>
  	</inertia>

  	<collision>
  		<origin xyz="0.0 0 0" rpy="0 0 0"/>
  		<geometry>
  			<box size="0.05 0.05 0.05"/>
  		</geometry>
  	</collision>

  	<visual>
  		<origin xyz="0 0 0" rpy="0 0 0"/>
  		<geometry>
  			<mesh filename="package://udacity_bot/meshes/hokuyo.dae"/>
  		</geometry>
  	</visual>
  </link>

  <joint type="fixed" name="hokuyo_joint">
  	<origin xyz="0.15 0 0.1" rpy="0 0 0"/>
  	<child link="hokuyo" />
  	<parent link="chassis"/>
  </joint>
<!-- /hokuyo -->

</robot>