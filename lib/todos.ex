defmodule Todos do
  def create_todos do
    { number_of_tasks, _ } = IO.gets("Enter the number of todos you want to add: ") |> Integer.parse()
    for _ <- 1..number_of_tasks do
      IO.gets("Enter Task: ") |> String.trim()
    end
  end

  def temp_todos do
    ["eat apple", "read book", "elixir series", "exercise"]
  end

  def complete_todo(tasks, task) do
    if contains?(tasks, task) do
      List.delete(tasks, task)
    else
      :not_found_error
    end
  end

  def add_new_todo(tasks, task) do
    List.insert_at(tasks, -1, task)
  end

  def contains?(tasks, task) do
    Enum.member?(tasks, task)
  end

  def keyword_search(tasks, keyword) do
    for task <- tasks, String.contains?(task, keyword) do
      task
    end
  end

  def random_task(tasks) do
    [task] = Enum.take_random(tasks, 1)
    task
  end

end
