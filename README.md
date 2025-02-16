# Игра для компании "Бомба"
Быстрая и веселая игра, которая поможет провести время в компании друзей.


## Механика игры: 
- Игроки встают в круг :o:, выбирают категории вопросов, которые будут задаваться приложением.
- Первый игрок запускает таймер :clock10: "бомбы" и на экране появляется вопрос.
- Каждый игрок отвечает на этот вопрос :question:  и передает телефон "бомбу" следующему игроку. :arrow_forward:
- Так может продолжаться не один круг :arrows_counterclockwise: , пока в руках одного из участников не пройзойдет "взрыв бомбы". :boom:
- Проигравшему достается наказание , например на следующем раунде хлопать в ладоши после ответа каждого игрока. :sweat_smile:


## Инициация проекта 

### Дизайнер проекта
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

________
### Организация работы в команде
Наш Team Leader: 
+ Создал проект на Git hub, настроил доступы
+ Прописал список задач, которые необходимо выполнить
+ Проводил ежедневные созвоны
+ Был на связи и отвечал на возникающие вопросы
+ Помогал распределять задачи в зависимости от уровня разработчков

________
### Git Flow
Мы реализовывали проект на основной ветке Develop.  
Каждую фичу выносили на отдельную ветку.
В работе использовали FORK. 
<img width="42" alt="image" src="https://github.com/user-attachments/assets/6b606a07-f890-48f8-8bc5-517cbaeb1e33" />  
<img width="803" alt="image" src="https://github.com/user-attachments/assets/165bd422-06c4-4b9a-977e-ba75377ad6c9" />


________
###  Тип верстки экранов
Мы выбрали **верстку кодом** , хотя у некоторых участников вообще не было такого опыта.  
Это порождало много вопросов, но мы получили хороший рост! :signal_strength:

________
### Используемы паттерны: 
#### Базовые компоненты
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
![Animation - 1739692140936](https://github.com/user-attachments/assets/4dbb1737-fe3a-4f20-8b7a-48095f33cb8b)





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
#### Timer Service:

```swift
protocol TimerDelegate: AnyObject {
    func timerIsFinished()
}

final class TimerService {
    weak var delegate: TimerDelegate?
    
    var timeLeft = 0
    var isPaused = false
    
    private var timer: Timer?
    
    func startTimer() {
        timer?.invalidate()
        timeLeft = DataService.shared.gameModel.settings.gameTime.value
        isPaused = false
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true
        )
    }
    
    func togglePause() {
        isPaused.toggle()
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func handleTimerIsFinished() {
        stopTimer()
        delegate?.timerIsFinished()
    }
    
    @objc private func updateTimer() {
        guard !isPaused else { return }
        if timeLeft > 0 {
            timeLeft -= 1
            print(timeLeft)
        } else {
            handleTimerIsFinished()
        }
    }
}
```

#### AudioPlayerService:

```swift
final class AudioPlayerService {
    private var audioPlayer: AVAudioPlayer?
    static let shared = AudioPlayerService()
   
    private init() {}
    
    /// Воспроизведение звука
    func playSound(named fileName: String, repeatable: Bool = false) {
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
            print("Файл \(fileName) не найден")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
            audioPlayer?.numberOfLoops = repeatable ? -1 : 0
        } catch {
            print("Ошибка при воспроизведении звука: \(error.localizedDescription)")
        }
    }
    
    /// Пауза
    func pause() {
        audioPlayer?.pause()
    }
    
    /// Продолжить воспроизведение
    func resume() {
        audioPlayer?.play()
    }
    
    /// Остановить воспроизведение
    func stop() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
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
<img width="200" alt="image" src="https://github.com/user-attachments/assets/e6c60103-f689-40e0-8222-1bea9c8aed83" />
<img width="200" alt="image" src="https://github.com/user-attachments/assets/afe31f31-b9ca-4047-908f-859d16d7a2f1" />
<img width="200" alt="image" src="https://github.com/user-attachments/assets/e3f8192f-25be-47f5-9047-2ef13d55f799" />
<img width="200" alt="image" src="https://github.com/user-attachments/assets/737642a3-0f6f-4dac-950c-b3efae7e21aa" />
<img width="200" alt="image" src="https://github.com/user-attachments/assets/fd5537cd-2ad0-4223-845f-c6aedc9f2ab9" />
<img width="200" alt="image" src="https://github.com/user-attachments/assets/0c376f57-1349-4dc9-a272-f5ce5073c6b1" />
<img width="200" alt="image" src="https://github.com/user-attachments/assets/70530018-4dd7-49c6-9e73-376f8b5de285" />
<img width="200" alt="image" src="https://github.com/user-attachments/assets/8d458152-7f08-4e24-85b5-4ae2392b4946" />
<img width="200" alt="image" src="https://github.com/user-attachments/assets/70085025-39b2-48be-9a68-d726b5ee0c7d" />
<img width="200" alt="image" src="https://github.com/user-attachments/assets/621dde30-6493-4409-88f5-b0d26e2198cc" />






