//
//  ViewController.swift
//  weatherApp
//
//  Created by 김윤홍 on 7/10/24.
//

import UIKit

import SnapKit

class ViewController: UIViewController {
  
  //URL 쿼리 아이템
  private let urlQueryItems: [URLQueryItem] = [
    URLQueryItem(name: "lat", value: "37.5"),
    URLQueryItem(name: "lon", value: "126.9"),
    URLQueryItem(name: "appid", value: "8522aee3ad052c4606b5d86dc14e6f91"),
    //URLQueryItem(name: "appid", value: "6bf71804fc6ed679164fe83b57a4b09c"),
    URLQueryItem(name: "units", value: "metric")
  ]
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "서울특별시"
    label.textColor = .white
    label.font = .boldSystemFont(ofSize: 30)
    return label
  }()
  
  private let tempLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.text = "20"
    label.font = .boldSystemFont(ofSize: 50)
    return label
  }()
  
  private let tempMinLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.text = "20"
    label.font = .boldSystemFont(ofSize: 20)
    return label
  }()
  
  private let tempMaxLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.text = "20"
    label.font = .boldSystemFont(ofSize: 20)
    return label
  }()
  
  private let tempStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.spacing = 20
    stackView.distribution = .fillEqually
    return stackView
  }()
  
  private let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.backgroundColor = .gray
    return imageView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    configureUI()
    fetchCurrentWeatherData()
  }
  
  private func fetchData<T: Decodable>(url: URL, completion: @escaping (T?) -> Void) {
    let session = URLSession(configuration: .default)
    session.dataTask(with: URLRequest(url: url)) { data, response, error in
      guard let data, error == nil else {
        completion(nil)
        return
      }
      
      let successRange = 200..<300

      if let response = response as? HTTPURLResponse, successRange.contains(response.statusCode) {
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
          print("JSON 디코딩 실패")
          completion(nil)
          return
        }
        completion(decodedData)
      } else {
        print("응답오류")
        completion(nil)
      }
    }.resume()
  }
  
  private func fetchCurrentWeatherData() {
    var urlComponents = URLComponents(string: "https://api.openweathermap.org/data/2.5/weather")
    urlComponents?.queryItems = self.urlQueryItems
    
    guard let url = urlComponents?.url else {
      print("잘못된 URL")
      return
    }
    
    fetchData(url: url) { [weak self] (result: CurrentWeatherResult?) in 
      guard let self, let result else { return }
      
      DispatchQueue.main.async {
        self.tempLabel.text = "\(Int(result.main.temp))C"
        self.tempMinLabel.text = "최소: \(Int(result.main.tempMin))C"
        self.tempMaxLabel.text = "최대: \(Int(result.main.tempMax))C"
      }
      
      guard let imageUrl = URL(string: "https://openweathermap.org/img/wn/\(result.weather[0].icon)@2x.png") else {
        return
      }
      
      if let data = try? Data(contentsOf: imageUrl) {
        if let image = UIImage(data: data) {
          DispatchQueue.main.async {
            self.imageView.image = image
          }
        }
      }
    }
  }
  
  private func configureUI() {
    view.backgroundColor = .black
    [
      titleLabel,
      tempLabel,
      tempStackView,
      imageView
    ].forEach{ view.addSubview($0) }
    
    [
      tempMinLabel,
      tempMaxLabel
    ].forEach {tempStackView.addArrangedSubview($0)}
    
    titleLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalToSuperview().offset(120)
    }
    
    tempLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(titleLabel.snp.bottom).offset(10)
    }
    
    tempStackView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(tempLabel.snp.bottom).offset(10)
    }
    
    imageView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.width.height.equalTo(120)
      make.top.equalTo(tempStackView.snp.bottom).offset(20)
    }
  }
}

