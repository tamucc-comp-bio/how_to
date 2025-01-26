# Raw Data

## Purpose
Contains original, unmodified data files. Never edit these directly.

## File Descriptions
- **(example) `plant_growth_raw.csv`**  
  Unprocessed measurements of plant growth recorded in the field.  

- **(example) `soil_samples_raw.csv`**  
  Unprocessed soil composition data collected from different plot locations.  

> **Note:**  
> - Do *not* edit or modify these raw data files manually.  
> - Any cleaning or processing of these data should be documented and saved in the `data_processed` (or a similarly named) directory.  
> - Update this section with additional file details as they are added.

## File Inventory
| Filename | Description | Source |
|----------|-------------|--------|
| `gps_waypoints.gpx` | Field GPS coordinates | Garmin GPSMAP 64 |
| `specimens.csv` | Field collection log | Manual entry |

## Relationships
```mermaid
graph LR
  A[specimens.csv] -->|processed_by| B(clean_specimens.R)
  C[gps_waypoints.gpx] -->|processed_by| B
