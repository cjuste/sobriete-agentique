<script setup lang="ts">
import { useNav } from '@slidev/client'

const { currentSlideNo } = useNav()
</script>

<template>
  <div class="slidev-layout default shodo-default">
    <div class="shodo-index">{{ String(currentSlideNo).padStart(2, '0') }}</div>
    <div class="shodo-rule" />
    <slot />
  </div>
</template>

<style scoped>
.shodo-default {
  position: relative;
}

.shodo-index {
  position: absolute;
  top: 1.5rem;
  left: 2rem;
  font-weight: 700;
  font-size: 0.85rem;
  letter-spacing: 0.1em;
  color: #ff175a;
}

.shodo-rule {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 1.15rem;
  width: 1px;
  background: rgba(255, 239, 212, 0.2);
}
</style>
