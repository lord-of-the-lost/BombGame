# Игра для компании "Бомба"
Быстрая и веселая игра, которая поможет провести время в компании друзей.


## Механика игры: 
- Игроки встают в круг :o:, выбирают категории вопросов, которые будут задаваться приложением.
- Первый игрок запускает таймер :clock10: "бомбы" и на экране появляется вопрос.
- Каждый игрок отвечает на этот вопрос :question:  и передает телефон "бомбу" следующему игроку. :arrow_forward:
- Так может продолжаться не один круг :arrows_counterclockwise: , пока в руках одного из участников не пройзойдет "взрыв бомбы". :boom:
- Проигравшему достается наказание , например на следующем раунде хлопать в ладоши после ответа каждого игрока. :sweat_smile:


## Инициация проекта 
### Создатель и дизайнер проекта
Дизайн и экраны приложения были спроектированы командой [Devrush](https://t.me/dev_rush)
<img width="55" alt="image" src="https://github.com/user-attachments/assets/66ae69f4-1e3c-4d44-9051-573b8b1ff96a" />   
Они проводят обучающий курс по `SWIFT`.

#### Предоставили файл Figma, который содержал:
- Палитру цветов элементов
- Экраны с расположением элементов

### Требования к проекту
+ Swift 5 +  
+ iOS 16 +  
+ Устройства: только iPhone и портретная ориентация экрана.

### Задачи проекта
Участники курса были разбиты на команды по 5 человек.  
В каждой из команд был назначет Team Leader.  
Задача команды - за 1 неделю создать приложение по предложенному дизайну.  


## Реализация проекта
### Авторы проекта и контакты
|Имя |Роль| Ник в Телеграмм|
|---|---|---|
|Николай|Тимлид|[@lord_0f_the_lost](https://t.me/lord_0f_the_lost)|
|Анна|Ведущий разработчик|[@anmelser](https://t.me/anmelser)|
|Дарья|Разработчик|[@daria_kotikova](https://t.me/daria_kotikova)|
|Барни|Разработчик|[@BarneyRich](https://t.me/BarneyRich)|
|Александр|Разработчик|[@slyhovsky](https://t.me/slyhovsky)|

### Организация работы в команде
Наш Team Leader: 
+ Создал проект на Git hub, настроил доступы
+ Прописал список задач, которые необходимо выполнить
+ Проводил ежедневные созвоны
+ Был на связи и отвечал на возникающие вопросы
+ Помогал распределять задачи в зависимости от уровня разработчков

### Git Flow
Мы реализовывали проект на основной ветке Develop.  
Каждую фичу выносили на отдельную ветку.
В работе использовали FORK. 
<img width="42" alt="image" src="https://github.com/user-attachments/assets/6b606a07-f890-48f8-8bc5-517cbaeb1e33" />


### Технические решения

#### Выбор типа верстки экранов
Мы выбрали **верстку кодом** , хотя у некоторых участников вообще не было такого опыта.  
Это порождало много вопросов, но мы получили хороший рост! :signal_strength:

#### Использование базовых компоненов
Были написаны базовые компоненты, которые далее использовались на экранах:
```swift
final class CommonButton: UIButton {
    init(title: String, backgroundColor: UIColor) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        layer.cornerRadius = 10
        setupTitle(title)
    }
```
#### Анимация
Анимация бомбы была выполена с применеием Lottie.

#### Палитра цветов была для удобства прописана через `enum`.

```swift
enum Palette {
    static let mainBackground: UIColor = UIColor(resource: ColorResource.mainBackground)
    static let gameBackground: UIColor = UIColor(resource: ColorResource.gameBackground)
    static let mainViewButton: UIColor = UIColor(resource: ColorResource.mainViewButton)
    static let gameViewButton: UIColor = UIColor(resource: ColorResource.gameViewButton)
    static let categorySheetBg: UIColor = UIColor(resource: ColorResource.categorySheetBg)
    static let mainSheetBg: UIColor = UIColor(resource: ColorResource.mainSheetBg)
    static let categoryCellBg: UIColor = UIColor(resource: ColorResource.categoryCellBg)
    static let accentColor: UIColor = UIColor(resource: ColorResource.accent)
    static let textPrimary: UIColor = UIColor(resource: ColorResource.textPrimary)
    static let textSecondary: UIColor = UIColor(resource: ColorResource.textSecondary)
}
```

#### Реализация продвинутых функций задания: 
Наша команда реализованы продвинутые задания:  
:white_check_mark:  Поменять время игры  
:white_check_mark:  Возможность менять звуки в игре  
:white_check_mark:  Включать / отключать вибрацию и задания для проигравшего игрока  

## Установка и запуск приложения
Скопируйте ссылку на проект в Git hub (ветка Develop).  
Откройте Xcode.  
Выберете в меню Xcode -> Integrate -> Clone
Вставьте скопированную ссылку.  
Запустите приложение на симуляторе.

## Процесс игры
<img width="326" alt="image" src="https://github.com/user-attachments/assets/27205991-76aa-447e-ba16-0e19e4bddd67" />  
<img width="331" alt="image" src="https://github.com/user-attachments/assets/a842717a-2149-4874-bdff-1df6b5465eaf" />  
<img width="326" alt="image" src="https://github.com/user-attachments/assets/bfe07c29-eeda-489f-8554-0413e29aef53" />  


## Добавить скрины:  

- Главный экран
- Лаунч скрин
- Категории
- Настройки
- Гифку про бомбу


## Вопросы:
- В какую ветку заливать ридми

## Паттерны:
- Timer Service (Delegate)
- Singletone (AudioPlayerService)
