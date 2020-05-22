<?php include("db.php"); ?>
<?php include("check.php"); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- head -->
    <?php include("head.php"); ?>
</head>
<body>

    <?php include("nav.php"); ?>

    <main class="container">
        <h3>Понравившиеся</h3>
        <br>
        <div class="row row-cols-2 row-cols-sm-3 row-cols-md-3 row-cols-lg-4 row-cols-xl-4">
            <?php
            $sql = "SELECT * FROM bag";
            $result = $conn->query($sql);
            $bags = $result->fetch_all(MYSQLI_ASSOC);
            $no = true;
            ?>
            <?php foreach ($bags as $bag) : ?>
                <?php if ($_COOKIE['l_'.$bag['id']]) : ?>
                    <div class="col mb-4">
                        <div class="card rounded-0 border-0">
                            <img src="<?= $bag['image'] ?>" alt="Bag image" class="card-img-top rounded-0">
                            <div class="card-body px-0 pt-1">
                                <a href="bag.php?id=<?= $bag['id'] ?>">
                                    <p class="card-text text-justify text"><?= $bag['title'] ?></p>
                                </a>
                                <h6 class="card-title pt-1">
                                    <?= get_price($bag['id']) ?>
                                    <span class="float-right"><i class="fa <?= check_for_like($bag['id']) ? 'fa-heart' : 'fa-heart-o' ?>" id="like_<?= $bag['id'] ?>" onclick="like(<?= $bag['id'] ?>)"></i></span>
                                </h6>
                            </div>
                        </div>
                    </div>
                    <?php $no = false; ?>
                <?php endif; ?>
            <?php endforeach; ?>
        </div>
        <?php if ($no) { echo "<p>Список пуст!</p>"; } ?>
    </main>

    <!-- bootstrap -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <!-- own script -->
    <script src="js/script.js" charset="utf-8"></script>
</body>
</html>
