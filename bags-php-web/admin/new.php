<?php include("../db.php"); ?>
<?php
session_start();
if (!isset($_SESSION['username'])) {
    $msg = "Войдите в аккаунт чтобы продолжить!";
    header("Location: new.php?msg=$msg");
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Admin</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Kulim+Park&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <?php include("header.php"); ?>

    <main class="container">
        <?php
        if (isset($_POST['submit'])) {
            $title = isset($_POST['title']) ? $_POST['title'] : '';
            $description = isset($_POST['description']) ? $_POST['description'] : '';
            $image = isset($_POST['image']) ? $_POST['image'] : '';
            $date = isset($_POST['date']) ? $_POST['date'] : '2020-01-01 00:00:00';
            $quantity = isset($_POST['quantity']) ? $_POST['quantity'] : '0';

            $sql = "INSERT INTO `bag` (`id`, `title`, `description`, `image`, `date`, `quantity`) VALUES (NULL, '$title', '$description', '$image', '$date', '$quantity')";

            if ($conn->query($sql) === TRUE) {
                echo '<p class="text-success">Добавлена новая запись!</p>';
                header("Location: index.php");
            } else {
                echo '<p class="text-danger">Попробуйте снова! Укажите правильные данные.</p>';
            }
        }
        ?>
        <form action="new.php" method="post">
            <div class="form-group">
                <label for="title">Название</label>
                <input type="text" class="form-control form-control-sm" name="title" id="title" placeholder="title" value="<?= isset($_GET['title']) && $_GET['title'] != '' ? $_GET['title'] : '' ?>">
            </div>
            <div class="form-group">
                <label for="description">Описание</label>
                <textarea class="form-control form-control-sm" name="description" placeholder="description" value="<?= isset($_GET['description']) && $_GET['description'] != '' ? $_GET['description'] : '' ?>" id="description" rows="3"></textarea>
            </div>
            <div class="form-group">
                <label for="image">Ссылка на картинку</label>
                <input type="datetime" class="form-control form-control-sm" name="image" id="image" value="<?= isset($_GET['image']) && $_GET['image'] != '' ? $_GET['image'] : '' ?>" placeholder="http://imageurl.com">
            </div>
            <div class="form-group">
                <label for="date">Дата</label>
                <input type="text" class="form-control form-control-sm" name="date" id="date" value="<?= isset($_GET['date']) && $_GET['date'] != '' ? $_GET['date'] : '' ?>" placeholder="2019-12-01 00:00:00">
            </div>
            <div class="form-group">
                <label for="quantity">Количество</label>
                <input type="number" class="form-control form-control-sm" name="quantity" id="quantity" value="<?= isset($_GET['quantity']) && $_GET['quantity'] != '' ? $_GET['quantity'] : '' ?>" placeholder="quantity">
            </div>
            <button type="submit" class="btn btn-primary btn-sm" name="submit">Добавить</button>
        </form>
    </main>

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script type="text/javascript">
        $('.toast').toast('show');
    </script>
    <?php $conn->close(); ?>
</body>
</html>
