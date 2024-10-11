import 'package:get/get.dart';

import 'Model/animeWebToonsModel.dart';
import 'Model/characterModel.dart';
import 'Model/detailsModel.dart';

class DummyData extends GetxController {
  RxList<AnimeWebToonsModel> popularWebtoons = [
    AnimeWebToonsModel(
      title: "Hello Baby",
      image:
          "https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-123040-750x375.webp",
      url: "https://animemangatoon.com/hello-baby/",
      description:
          "Gwen is a kind and passionate young woman with a tragic backstory...",
      creator: "Enjelicious",
      genre: "Romance, Family, Comedy",
      details: DetailsModel(
        characters: [
          CharacterModel(
            name: "Gwen",
            description:
                "The main protagonist, a kind-hearted woman with a tragic past who finds herself in a whirlwind romance after a vacation fling.",
            image: "https://via.placeholder.com/150", // Placeholder image
          ),
          CharacterModel(
            name: "Arthur",
            description:
                "A lonely but wealthy young man who crosses paths with Gwen and later discovers they have a child together.",
            image: "https://via.placeholder.com/150", // Placeholder image
          ),
        ],
        conclusion:
            "Gwen and Arthur reunite, overcome their differences, and decide to raise their child together.",
        status: "Completed",
        rating: 4.8,
      ),
    ),
    AnimeWebToonsModel(
      title: "The Alpha King's Claim",
      image:
          "https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-123400-750x375.webp",
      url: "https://animemangatoon.com/the-alpha-kings-claim/",
      description: "A thrilling tale of a werewolf alpha...",
      creator: "Kim Jae-Hwan",
      genre: "Fantasy, Romance, Action",
      details: DetailsModel(
        characters: [
          CharacterModel(
            name: "Alpha King",
            description:
                "The powerful alpha who rules his pack and falls in love with a human, battling his instincts to protect her.",
            image: "https://via.placeholder.com/150", // Placeholder image
          ),
          CharacterModel(
            name: "Human Girl",
            description:
                "A strong-willed human woman who finds herself caught in a supernatural world of werewolves and power struggles.",
            image: "https://via.placeholder.com/150", // Placeholder image
          ),
        ],
        conclusion:
            "The Alpha King and the human girl unite their worlds and start a new life together, defeating all their enemies.",
        status: "Completed",
        rating: 4.5,
      ),
    ),
    AnimeWebToonsModel(
      title: "Bitten Contract",
      image:
          "https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-123842-750x375.webp",
      url: "https://animemangatoon.com/bitten-contract/",
      description:
          "A mysterious contract leads to a forbidden love between a vampire and a human.",
      creator: "Lee Ji-Hye",
      genre: "Fantasy, Romance, Mystery",
      details: DetailsModel(
        characters: [
          CharacterModel(
            name: "Vampire",
            description:
                "An ancient and powerful vampire who is bound by a mysterious contract, struggling to break free and find love.",
            image: "https://via.placeholder.com/150", // Placeholder image
          ),
          CharacterModel(
            name: "Human Girl",
            description:
                "A brave young woman who unknowingly signs a contract with the vampire and becomes entangled in his dark world.",
            image: "https://via.placeholder.com/150", // Placeholder image
          ),
        ],
        conclusion:
            "They break the curse of the contract, find love, and the vampire regains his freedom to live alongside the human girl.",
        status: "Completed",
        rating: 4.6,
      ),
    ),
    AnimeWebToonsModel(
      title: "Tricked into Becoming the Heroine’s Stepmother",
      image:
          "https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-125252-750x375.webp",
      url:
          "https://animemangatoon.com/tricked-into-becoming-the-heroines-stepmother/",
      description:
          "A modern Cinderella story where the stepmother unexpectedly becomes the heroine's guardian.",
      creator: "Park Hye-Ri",
      genre: "Romance, Comedy, Drama",
      details: DetailsModel(
        characters: [
          CharacterModel(
            name: "Stepmother",
            description:
                "A witty and kind-hearted woman who is tricked into becoming the guardian of the heroine but ends up forming a bond with her.",
            image: "https://via.placeholder.com/150", // Placeholder image
          ),
          CharacterModel(
            name: "Heroine",
            description:
                "A strong-willed young girl who initially resents her new stepmother but grows to love and trust her.",
            image: "https://via.placeholder.com/150", // Placeholder image
          ),
        ],
        conclusion:
            "The stepmother and the heroine overcome their misunderstandings and live happily together, changing the traditional stepmother narrative.",
        status: "Completed",
        rating: 4.7,
      ),
    ),
    AnimeWebToonsModel(
      title: "The Guy Upstairs",
      image:
          "https://animemangatoon.com/wp-content/uploads/2024/08/Screenshot-2024-05-28-192655-e1723318535608-750x375.png",
      url: "https://animemangatoon.com/the-guy-upstairs/",
      description:
          "A heartwarming story about a lonely woman who finds friendship with her neighbor.",
      creator: "Lee Na-Young",
      genre: "Romance, Drama, Slice of Life",
      details: DetailsModel(
        characters: [
          CharacterModel(
            name: "Lonely Woman",
            description:
                "An introverted woman living a quiet life until she starts to get to know her upstairs neighbor.",
            image: "https://via.placeholder.com/150", // Placeholder image
          ),
          CharacterModel(
            name: "Neighbor",
            description:
                "A kind and friendly man who helps the lonely woman open up and find joy in life again.",
            image: "https://via.placeholder.com/150", // Placeholder image
          ),
        ],
        conclusion:
            "They form a deep connection and eventually fall in love, giving the lonely woman a new perspective on life.",
        status: "Completed",
        rating: 4.3,
      ),
    ),
    AnimeWebToonsModel(
      title: "There Must Be Happy Endings",
      image:
          "https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-133040-jpg.webp",
      url: "https://animemangatoon.com/there-must-be-happy-endings/",
      description:
          "A heartwarming story about a woman who finds hope and love after a tragedy.",
      creator: "Kim Eun-Hee",
      genre: "Romance, Drama, Slice of Life",
      details: DetailsModel(
        characters: [
          CharacterModel(
            name: "Woman",
            description:
                "A resilient woman who faces a major tragedy but manages to find hope and love through her journey.",
            image: "https://via.placeholder.com/150", // Placeholder image
          ),
          CharacterModel(
            name: "Love Interest",
            description:
                "A kind and understanding man who helps her heal and find happiness again.",
            image: "https://via.placeholder.com/150", // Placeholder image
          ),
        ],
        conclusion:
            "They find love and happiness together, overcoming their tragic pasts.",
        status: "Completed",
        rating: 4.9,
      ),
    ),
  ].obs;
}
