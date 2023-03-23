<template>
  <div class="the-button">
    <button>
      <slot></slot>
    </button>
  </div>
</template>

<script>
export default {};
</script>

<style>
.the-button {
  position: relative;
  display: inline-block;
}

.the-button button {
  padding: 9px 22px;
  font-size: 15px;
  background-color: var(--brand-color);
  border: 1px solid var(--brand-color);
  color: #fff;
  cursor: pointer;
  box-shadow: 0 2px 2px 1px #afafaf;
  border-radius: 3px;
}

.the-button button:hover {
  color: #ffdac8;
  background: #000;
  box-shadow: 0 2px 3px 2px #afafaf;
}

.the-button--block {
  width: 100%;
}

.the-button__loading {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: 9;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: rgb(48, 15, 15);
}

.the-button button {
  width: 100%;
}

.the-button__loading img {
  width: 25px;
}
</style>
