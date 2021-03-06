<?php include("../db.php"); ?>
<?php
session_start();
if (!isset($_SESSION['username'])) {
    $msg = "Войдите в аккаунт чтобы продолжить!";
    if (isset($_GET['id'])) {
        $id = $_GET['id'];
        header("Location: info.php?id=$id&msg=$msg");
        exit;
    } else {
        header("Location: index.php?msg=$msg");
        exit;
    }
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
        <div class="row">
            <?php
            if (isset($_GET['id'])) {
                $id = $_GET['id'];
                $sql = "SELECT * FROM bag WHERE id = $id";
                $result = $conn->query($sql);
                $bag = $result->fetch_assoc();
            } else {
                echo "Id required!";
            }
            ?>
            <div class="col-lg-4">
                <div id="images_carousel" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#images_carousel" data-slide-to="0" class="active"></li>
                        <?php for ($i=1; $i <= $res->num_rows; $i++) : ?>
                            <li data-target="#images_carousel" data-slide-to="<?= $i ?>"></li>
                        <?php endfor; ?>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100" src="<?= $bag['image'] ?>" alt="First slide">
                        </div>
                        <?php foreach ($images as $img) : ?>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="<?= $img['image'] ?>" alt="Other slide">
                            </div>
                        <?php endforeach; ?>
                    </div>
                    <a class="carousel-control-prev" href="#images_carousel" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#images_carousel" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="col-lg-8">
                <h3 class="text-justify mt-3 mb-3 mt-lg-0 mt-xl-0"><?= $bag['title'] ?></h3>
                <h6 class="text-justify mt-3 mb-3 mt-lg-0 mt-xl-0"><?= $bag['description'] ?></h6>
                <div class="row">
                    <div class="col-lg-6 mb-2">
                        <button type="button" class="btn btn-info btn-block" data-toggle="modal" data-target="#shop" name="button">Купить</button>
                    </div>
                    <div class="col-lg-6 mb-2">
                        <button type="button" class="btn btn-outline-secondary btn-block" name="button">В избранное</button>
                    </div>
                </div>
                <?php
                if (isset($_GET['id'])) {
                    $id = $_GET['id'];
                    $sql = "SELECT * FROM `record` WHERE `bag` = $id";
                    $result = $conn->query($sql);
                    $records = $result->fetch_all(MYSQLI_ASSOC);
                } else {
                    echo "Нет дополнительной информации!";
                }
                ?>
                <table class="table table-sm table-hover">
                    <tbody>
                        <?php foreach ($records as $record) : ?>
                            <tr>
                                <td><?= $record['feature'] ?></td>
                                <td><?= $record['value'] ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
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
