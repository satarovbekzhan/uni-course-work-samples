<?php include("db.php"); ?>
<?php include("check.php"); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- head -->
    <?php include("head.php"); ?>
</head>
<body>

    <!-- navbar -->
    <?php include("nav.php"); ?>

    <!-- item info -->
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
                <?php
                if (isset($_GET['id'])) {
                    $id = $_GET['id'];
                    $sql = "SELECT * FROM `image` WHERE `bag` = $id";
                    $res = $conn->query($sql);
                    $images = $res->fetch_all(MYSQLI_ASSOC);
                }
                ?>
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
                        <button type="button" id="like_button" class="btn btn-outline-secondary btn-block" onclick="like_bag(<?= $_GET['id'] ?>)" name="button"><?= check_for_like($_GET['id']) ? 'Удалить из избранных' : 'В избранное' ?></button>
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

    <div class="modal fade" id="shop" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content rounded-0">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Купить</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="" method="get">
                        <div class="form-group">
                            <label for="phone">Номер телефона</label>
                            <input type="tel" id="phone" placeholder="+996-000-000-000" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="name">Имя и фамилия</label>
                            <input type="text" id="name" placeholder="Иван Иванов" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="city">Город</label>
                            <input type="text" id="city" placeholder="Бишкек" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="street">Улица / жилой комплекс</label>
                            <input type="text" id="street" placeholder="ул.Ахунбаева" class="form-control">
                        </div>
                        <div class="form-row">
                            <div class="col-6">
                                <input type="text" class="form-control" placeholder="Дом">
                            </div>
                            <div class="col-6">
                                <input type="text" class="form-control" placeholder="Квартира">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="comment">Комментарий к заказу</label>
                            <textarea name="comment" id="comment"rows="3" class="form-control" placeholder="Дополнительная информация к заказу..."></textarea>
                        </div>
                        <button type="button" class="btn btn-primary">Готово</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- bootstrap -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <!-- own script -->
    <script src="js/script.js" charset="utf-8"></script>
</body>
</html>
