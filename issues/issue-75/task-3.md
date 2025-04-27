# タスク3メモ：Firestoreコレクション・ドキュメント設計案

## 1. コレクション名
- 観光スポット（聖地）: `spots`
- アニメ: `animes`

---

## 2. ドキュメント構造例

### spots コレクションのドキュメント例
```json
{
  "id": "spot_001",
  "name": "○○神社",
  "description": "アニメ『△△』の聖地。...",
  "location": { "latitude": 35.123, "longitude": 139.456 },
  "imageUrls": ["https://.../img1.jpg", "https://.../img2.jpg"],
  "category": "歴史",
  "address": "東京都○○区...",
  "openingHours": { "mon": "9:00-17:00", "sun": "9:00-16:00" },
  "tags": ["神社", "自然"],
  "animeIds": ["anime_001", "anime_002"],
  "createdAt": "2024-06-01T12:00:00Z",
  "updatedAt": "2024-06-10T09:00:00Z",
  "isPublished": true
}
```

### animes コレクションのドキュメント例
```json
{
  "id": "anime_001",
  "title": "△△",
  "description": "△△のあらすじ...",
  "startYear": 2021,
  "endYear": 2022,
  "officialSite": "https://...",
  "imageUrl": "https://.../anime.jpg",
  "spotIds": ["spot_001", "spot_002"],
  "createdAt": "2024-05-01T10:00:00Z",
  "updatedAt": "2024-06-10T09:00:00Z"
}
```

---

## 3. 設計意図・補足
- コレクション名は複数形で統一（spots, animes）
- ドキュメントIDは自動生成または明示指定
- 多対多リレーションはID配列（animeIds, spotIds）で管理
- Firestoreの型（string, array, map, timestamp, geopoint）に準拠
- 今後の拡張や運用も考慮した柔軟な設計
