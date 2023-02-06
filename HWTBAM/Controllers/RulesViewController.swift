import UIKit

class RulesViewController: UIViewController {

    var scrollView = UIScrollView()

    private let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        image.contentMode = .scaleAspectFill
        return image
    }()

    private let rulesHeadLabel: UILabel = {
        let label = UILabel()
        label.text = "Правила игры"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label

    }()

    private let rulesTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .justified
        label.text = """
    Игра Кто хочет стать миллионером? - это конкурс викторина, в котором участники должны правильно ответить на ряд вопросов с несколькими вариантами ответов, чтобы перейти на следующий уровень. Всего 15 вопросов, каждый вопрос стоит определенной суммы денег, участники не имеют никаких временных ограничений для предоставления ответа. Участники также получают три вида подсказок, чтобы помочь себе, если они застряли на конкретном вопросе.

    Вопросы “Кто хочет стать миллионером?” структурированы в соответствии с пятью различными уровнями, причем уровень сложности постепенно увеличивается. Каждый уровень содержит три вопроса.

    Вопросы, сгруппированные на одном уровне, будут иметь одинаковую сложность. Например: вопросы 1-3 составляют первый уровень и будут содержать самые простые вопросы. Второй уровень (вопросы 4–6) будет несколько сложнее, за ним следует третий уровень (вопросы 7–9). Четвертый уровень (вопросы 10–12) будет состоять из действительно сложных вопросов, за которыми следует пятый и последний уровень (вопросы 13–15), имеющий самые сложные вопросы в игре.

    Важно помнить, что вопросы, составляющие каждый уровень, не обязательно будут относиться к одним и тем же или даже сходным темам, но их общий уровень сложности будет одинаковым. Немаловажно, что уровни вопросов не следует путать с «несгораемыми суммами» или структурой ценностей вопросов, что они собой являют объясняется ниже.

    Важно помнить, что вопросы, составляющие каждый уровень, не обязательно будут относиться к одним и тем же или даже сходным темам, но их общий уровень сложности будет одинаковым. Немаловажно, что уровни вопросов не следует путать с «несгораемыми суммами» или структурой ценностей вопросов, что они собой являют объясняется ниже.

    Вопрос 1 100 руб.
    Вопрос 2 200 руб.
    Вопрос 3 300 руб.
    Вопрос 4 500 руб.
    Вопрос 5 - 1000 руб. Несгораемая сумма.

    Если участники неправильно отвечают на последний вопрос вопрос, то они уходят ни с чем. Если на этот вопрос дан правильный ответ, участникам гарантируется 1000 рублей, даже если дадут неверный ответ до достижения следующей несгораемой суммы в десятом вопросе.

    Вопрос 6 2000 руб.
    Вопрос 7 4000 руб.
    Вопрос 8 8000 руб.
    Вопрос 9 16 000 руб.
    Вопрос 10 - 32 000 руб. Несгораемая сумма.

    Если участники неправильно ответят на этот вопрос, они уйдут с 1000 рублей. Если на этот вопрос ответили верно, игрокам гарантируется 32 000 рублей, даже если дадут неверный ответ до достижения вопроса 15.

    Вопрос 11 64 000 руб.
    Вопрос 12 125 000 руб.
    Вопрос 13 250 000 руб.
    Вопрос 14 500 000 руб.
    Вопрос 15 - 1 000 000 руб.

    Подсказки
    Участникам разрешается применить три подсказки, которые они могут использовать в любой момент викторины. Каждая из подсказок может быть использована только один раз.

    50/50 - исключает два неправильных ответа из множественного выбора, оставляя участнику только один правильный и один неправильный вариант. Это означает, что у него есть шанс 50/50.

    Задать вопрос аудитории - залу задают тот же вопрос, что и участнику, и проводится быстрый опрос, чтобы показать их ответы. На диаграмме показывается явное преимущество определенного варианта, эта подсказка может быть чрезвычайно полезной. Участнику дается возможность согласиться с результатами, полученными от аудитории.

    Позвоните другу - участникам разрешается сделать 30-секундный звонок другу или члену семьи и спросить, знают ли они ответ на вопрос.
"""
        return label
    }()

    private let returnButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "green")
        button.tintColor = UIColor.white
        button.setTitle("Назад", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        button.layer.cornerRadius = 14
        button.addTarget(self, action: #selector(clickReturn), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setConstraint()
    }

    func setLayout() {
        view.addSubview(backgroundImageView)
        view.addSubview(scrollView)
        scrollView.addSubview(rulesHeadLabel)
        scrollView.addSubview(rulesTextLabel)
        scrollView.addSubview(returnButton)
    }

    func setConstraint() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        rulesHeadLabel.translatesAutoresizingMaskIntoConstraints = false
        rulesTextLabel.translatesAutoresizingMaskIntoConstraints = false
        returnButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            rulesHeadLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 24),
            rulesHeadLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            rulesHeadLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),

            rulesTextLabel.topAnchor.constraint(equalTo: rulesHeadLabel.bottomAnchor, constant: 16),
            rulesTextLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            rulesTextLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            rulesTextLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32),

            returnButton.topAnchor.constraint(equalTo: rulesTextLabel.bottomAnchor,constant: 16),
            returnButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            returnButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            returnButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 8),
            returnButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    @objc func clickReturn() {
        print("return")
    }
}
