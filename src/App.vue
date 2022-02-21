<template>
  <div id="app">
    <h2>Todo List</h2>
    <div class="todo-add">
      <form @submit.prevent="addTodoList">
        <input
          type="text"
          placeholder="Add todo"
          class="todo"
          v-model="task"
          autofocus
        />
        <button type="submit" class="btn">Add Todo</button>
      </form>
    </div>
    <div class="todo-row" v-for="(todo, index) in todos" :key="index">
      <span> {{ todo.name }}</span>
      <div v-if="index > 0" class="all-list">
        <button @click="EditTask(index)" class="edit-icond">Edit</button>
        <button @click="DeleteTask(index)" class="delete-icon">Delete</button>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";

@Component({
  components: {},
})
export default class TodoList extends Vue {
  task = "";
  edittask = null;
  public todos = [
    {
      name: "",
    },
  ];
  addTodoList() {
    if (this.task.length === 0) return;
    if (this.edittask === null) {
      this.todos.push({
        name: this.task,
      });
      this.task = "";
    } else {
      this.todos[this.edittask].name = this.task;
      this.edittask = null;
      this.task = "";
    }
  }
  DeleteTask(index: number) {
    this.todos.splice(index, 1);
  }
  EditTask(index: any) {
    this.task = this.todos[index].name;
    this.edittask = index;
  }
}
</script>

<style>
body {
  background: linear-gradient(
    90deg,
    rgb(93, 78, 194) 0%,
    rgb(159, 100, 255) 100%
  );
  font-family: "Trebuchet MS", "Lucida Sans Unicode", "Lucida Grande",
    "Lucida Sans", Arial, sans-serif;
}
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: white;
}
h2 {
  color: #fff;
  font-size: 24px;
  font-family: "Times New Roman", Times, serif;
}
.todo-add input {
  padding: 14px 32px 14px 16px;
  border-radius: 4px 0 0 4px;
  border: 2px solid #5d0cff;
  outline: none;
  justify-content: center;
  width: 320px;

  background: transparent;
  color: #fff;
}
button {
  padding: 16px;
  border: none;
  border-radius: 0 4px 4px 0;
  cursor: pointer;
  outline: none;
  background: linear-gradient(
    90deg,
    rgba(93, 12, 255, 1) 0%,
    rgba(155, 0, 250, 1) 100%
  );
  color: #fff;
  text-transform: capitalize;
  margin: 0;
}

/* list */
.todo-row {
  display: flex;
  position: relative;
  justify-content: space-between;
  align-items: center;
  margin: 4px auto;
  color: #fff;
  background: linear-gradient(
    90deg,
    rgba(255, 118, 20, 1) 0%,
    rgba(255, 84, 17, 1) 100%
  );
  justify-content: flex-end;

  border-radius: 5px;
  width: 500px;
}

.todo-row:nth-child(4n + 1) {
  background: linear-gradient(
    90deg,
    rgba(93, 12, 255, 1) 0%,
    rgba(155, 0, 250, 1) 100%
  );
}

.todo-row:nth-child(4n + 2) {
  background: linear-gradient(
    90deg,
    rgba(255, 12, 241, 1) 0%,
    rgba(250, 0, 135, 1) 100%
  );
}

.todo-row:nth-child(4n + 3) {
  background: linear-gradient(
    90deg,
    rgba(20, 159, 255, 1) 0%,
    rgba(17, 122, 255, 1) 100%
  );
}
.todo-row button {
  border-radius: 4px;
  justify-content: flex-end;
  margin: 10px;
  background: skyblue;
  box-shadow: 3px 3px 3px grey;
}
.todo-row span {
  position: absolute;
  left: 10px;
  font-size: 25px;
  font-family: cursive;
}
.icons {
  display: flex;
  align-items: center;
  font-size: 24px;
  cursor: pointer;
}
</style>
