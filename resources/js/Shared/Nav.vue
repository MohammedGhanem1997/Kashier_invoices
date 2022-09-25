<template>
  <nav>
    <ul class="flex space-x-12">
      <li>
        <NavLink href="/" :active="$page.component === 'Home'">
          <i class="fa fa-house-user"></i>
        </NavLink>
      </li>

      <li>
        <NavLink href="/users" :active="$page.component === 'Users'">
          <i class="fa fa-users"></i>
        </NavLink>
      </li>

      <li>
        <NavLink href="/settings" :active="$page.component === 'Settings'">

          <i class="fa fa-screwdriver-wrench"></i>
        </NavLink>
      </li>

      <li>
        <NavLink href="/logout" method="post" as="button">
          <i class="fa fa-door-open"></i>
        </NavLink>
      </li>
    </ul>
  </nav>
</template>

<script>
import NavLink from "./NavLink";

export default {
  components: { NavLink },
};
</script>
<style>

  li{
    font-size: 22px;
  }

</style>
