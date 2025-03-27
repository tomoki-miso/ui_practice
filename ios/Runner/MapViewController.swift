import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    private let staffList: [Staff]

    init(staffList: [Staff]) {
        self.staffList = staffList
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        // 最初のスタッフの位置をカメラの初期位置に
        let initialLatitude = staffList.first?.latitude ?? 0.0
        let initialLongitude = staffList.first?.longitude ?? 0.0
        let camera = GMSCameraPosition.camera(withLatitude: initialLatitude, longitude: initialLongitude, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        view = mapView

        // 各スタッフの位置にマーカーを追加
        for staff in staffList {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: staff.latitude, longitude: staff.longitude)
            marker.title = staff.name
            marker.snippet = "Lat: \(staff.latitude), Lng: \(staff.longitude)"
            marker.map = mapView
        }
    }
}
